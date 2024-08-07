#!/bin/bash
#
DEFAULT_BROWSER="${BROWSER:-"brave-browser-stable"}"
PROFILE_NAME="${1:-main}"
SITE=${2:-}
PROFILE_DIR="~/.local/profiles/${PROFILE_NAME}"

mkdir -p "${PROFILE_DIR}"

"${DEFAULT_BROWSER}" --user-data-dir="${PROFILE_DIR}" --window-name="${PROFILE_DIR}" "${SITE}" > /dev/null
