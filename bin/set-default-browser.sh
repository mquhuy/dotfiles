#!/bin/bash
#
REPO_ROOT=$(realpath "$(dirname $(readlink -f $0))/..")
browser_dirs="${REPO_ROOT}/desktop/browsers"
chosen_browser=$(ls -1 ${browser_dirs} | fzf)
desktop_loc="${HOME}/.local/share/applications"

if [ ! -f "${desktop_loc}/${chosen_browser}" ]; then
    echo "Creating symlink for ${chosen_browser}"
    ln -s ${browser_dirs}/${chosen_browser} ${desktop_loc}/${chosen_browser}
fi
#
xdg-settings set default-web-browser "${chosen_browser}"
echo xdg-settings set default-web-browser "${chosen_browser}"
