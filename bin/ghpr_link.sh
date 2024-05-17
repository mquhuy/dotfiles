#!/bin/bash

url=$(xclip -select clipboard -o)
if [[ ${url} != "https://github.com"* ]]; then
	echo "Not true"
	exit 1
fi

# Extract the owner, repo, and PR number from the URL
owner=$(echo $url | cut -d'/' -f4)
repo=$(echo $url | cut -d'/' -f5)
pr_number=$(echo $url | cut -d'/' -f7)

# Use the GitHub API to get the PR details
response=$(curl -s "https://api.github.com/repos/$owner/$repo/pulls/$pr_number")

# Extract the PR title from the response
title=$(echo $response | grep -Po '"title":.*?[^\\]",' | cut -d'"' -f4)

echo "[$title]($url)" | xclip -selection clipboard
