#!/bin/env bash
#
function get_noti_count() {
  noti_count=$(gh api -H "Accept: application/vnd.github+json" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    /notifications | jq '. | length')
  if [[ $noti_count -gt 0 ]]; then
    echo "🔥: $noti_count"
  else
    echo "   🎉   "
  fi
}

case ${BLOCK_BUTTON:-} in
    1)
      microsoft-edge-stable --app="https://github.com/notifications"
      ;;
    2)
      microsoft-edge-stable --app="https://github.com/notifications"
      ;;
    *)
      get_noti_count
      ;;
esac
