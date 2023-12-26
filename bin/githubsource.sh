#/usr/bin/bash

filename=$1
lineNumber=$2
__dir__=$(dirname $filename)

cd $__dir__
GIT_ROOT=$(git rev-parse --show-toplevel)
REL_PATH=$(realpath -m --relative-to=$GIT_ROOT $filename)

fetch_URL=$(git remote show origin | grep "Fetch URL" | awk -F"github.com" '{print $2}')
fetch_URL=$(bash -c "sed 's/:/\//' <<<$fetch_URL")
echo "https://github.com${fetch_URL%.git}/blob/main/$REL_PATH#L${lineNumber}"
