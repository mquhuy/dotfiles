#!/bin/bash
#
DEFAULT_BROWSER="${BROWSER:-"brave-browser-stable"}"
PROFILE_NAME="${1:-main}"
SITE=${2:-}
PROFILE_DIR="${HOME}/.local/profiles/${PROFILE_NAME}"

mkdir -p "${PROFILE_DIR}"

"${DEFAULT_BROWSER}" --ozone-platform=wayland --user-data-dir="${PROFILE_DIR}" --window-name="${PROFILE_NAME}" "${SITE}" > /dev/null
