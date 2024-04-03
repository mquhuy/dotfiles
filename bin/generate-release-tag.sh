#!/bin/bash
#

root=$(pwd)
real="false"
tag_name=""
action="create"

OPTIONS=$(getopt -o a:t:r --long action:,tag:,real: -- "$@")

if [ $? -ne 0 ]; then
  echo "getopt error"
  exit 1
fi

eval set -- "$OPTIONS"

while true; do
  case "$1" in
    a|--action) action="$2" ; shift ;;
    t|--tag) tag_name="$2" ; shift ;;
    r|--real) real="$2" ; shift ;;
    --) shift ; break ;;
    *) echo "Unknown option: $1" ; exit 1 ;;
  esac
  shift
done

set -u

make_tag(){
    tag=${1}
    if [[ ${tag} =~ (^v.*|^capm3-v.*) ]]; then
        echo "Primary release tag name: ${tag}, tagging with -s and -a"
        if [[ ${real} != "false" ]]; then
            git tag -s -a "${tag}" -m "${tag}"
            echo "Pushing tag ${tag_name} to ${remote_name}"
            git push ${remote_name} ${tag_name}
        fi
    elif [[ ${tag} =~ /v* ]]; then
        echo "Secondary release tag name: ${tag}, tagging without -a"
        if [[ ${real} != "false" ]]; then
            git tag ${tag}
            echo "Pushing tag ${tag_name} to ${remote_name}"
            git push ${remote_name} ${tag_name}
        fi
    else
        echo "Invalid tag name: ${tag}"
        exit 1
    fi
}

delete_tag(){
    tag=${1}
    git tag -d ${tag}
    git push --delete ${remote_name} ${tag}
}

get_remote_name(){
    remote_name=$(git remote -v | grep fetch | grep git@github.com:metal3-io | awk '{print $1}')
    echo $remote_name
}

if [[ ${tag_name} == "" ]]; then
    echo "Please provide a tag name"
    exit 1
fi

if [[ ${real} == "false" ]]; then
    echo "This is a trial run, no tags will be pushed"
else
    echo "This is a real run, tags will be pushed"
fi

remote_name=$(get_remote_name)

if [[ ${remote_name} == "" ]]; then
    echo "No remote repo from metal3-io org found"
    exit 1
fi

remote_url=$(git remote get-url ${remote_name})

echo "Remote url: $remote_url, Remote name: $remote_name"

git checkout main
git pull
if [[ ${action} == "create" ]]; then
    make_tag ${tag_name}
elif [[ ${action} == "delete" ]]; then
    delete_tag ${tag_name}
else
    echo "Invalid action"
    exit 1
fi

go_mod_files=($(find -type f -name go.mod))

for go_mod_file in ${go_mod_files[@]}; do
    dirname=$(dirname ${go_mod_file} | tr -d "./")
    if [[ ${dirname} == "" || ${dirname} == "hacktools" ]]; then
        continue
    fi
    new_tag="${dirname}/${tag_name}"
    echo "Updating ${dirname} with tag ${new_tag}"
    if [[ ${action} == "create" ]]; then
        make_tag ${new_tag}
    elif [[ ${action} == "delete" ]]; then
        delete_tag ${new_tag}
    else
        echo "Invalid action"
        exit 1
    fi
done

echo "Release draft is created in https://$(echo $remote_url | sed 's/git@//;s/:/\//;s/\.git$//')/releases"

if [[ $(echo $remote_url | grep -c "cluster-api-provider-metal3") == "1" ]]; then
    echo "Generating mariadb tag"
    cd "${root}/../mariadb-image"
    generate-release-tag.sh --tag "capm3-${tag_name} --real ${real}"
fi

echo "Remember to run ./hack/verify-release.sh $(echo $tag_name | sed 's/v//') afterwards"
