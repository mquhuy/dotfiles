#!/bin/bash
#
DEFAULT_BROWSER="${BROWSER:-"brave-browser-stable"}"
PROFILE_NAME="${1:-main}"
SITE=${2:-}
HOME_DIR="${HOME:-/home/${USER:-huy}}"
PROFILE_DIR="${HOME_DIR}/.local/profiles/${PROFILE_NAME}"

mkdir -p "${HOME_DIR}/.local/profiles"

if [[ ! -d "${PROFILE_DIR}" ]]; then
    cp -r ~/.config/BraveSoftware/Brave-Browser "${PROFILE_DIR}"
fi
mkdir -p "${PROFILE_DIR}"

"${DEFAULT_BROWSER}" --user-data-dir="${PROFILE_DIR}" --window-name="${PROFILE_NAME}" "${SITE}" > /dev/null
