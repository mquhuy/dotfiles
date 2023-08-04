#!/bin/bash
#
echo "Rechecking out the current PR"
current_branch=$(git rev-parse --abbrev-ref HEAD)
git checkout main
git branch -D ${current_branch}
current_pr=$(gh pr list -H ${current_branch} --json number --jq .[0].number)
echo $current_pr
gh pr checkout $current_pr
