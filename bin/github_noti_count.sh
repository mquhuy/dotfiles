#!/bin/bash
#
function get_noti_count() {
  source $HOME/.gh_token
  noti_count=$(gh api -H "Accept: application/vnd.github+json" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    /notifications | jq '. | length')
  if [[ $noti_count -gt 0 ]]; then
    echo "🚩: $noti_count"
  else
    echo "   🎉   "
  fi
}

case ${BLOCK_BUTTON:-} in
    1)
      start-or-focus.sh ghnotis
      get_noti_count
      ;;
    2)
      ghnotis
      get_noti_count
      ;;
    *)
      get_noti_count
      ;;
esac
