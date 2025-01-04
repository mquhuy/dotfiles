#!/usr/bin/env bash
#
KMONAD_CONFIG_DIR=${DOTFILES_DIR}/config/kmonad
chosen_keyboard=$(ls ${KMONAD_CONFIG_DIR}/* | rofi -dmenu)
if [[ "${chosen_keyboard##*.}" == "org" ]]; then
  emacs --batch --eval "(require 'org)" --eval "(org-babel-tangle-file \"${chosen_keyboard}\")"
else
  rm -f "${KMONAD_CONFIG_DIR}/config.kbd"
  cp "${chosen_keyboard}" "${KMONAD_CONFIG_DIR}/config.kbd"
fi
device_name="$(grep -oP '(?<=input \(device-file \").*(?=\")' ~/.config/kmonad/config.kbd)"
if [[ "$device_name" != "/dev/*" ]]; then
  export device_name
  python3 <<'END_PYTHON'
import os
import re

device_name = os.environ['device_name']
print(device_name)
with open('/proc/bus/input/devices') as f:
    devices = f.read().split('\n\n')
    for device in devices:
        if device_name in device:
            device_file = re.search(r'event\d+', device).group()
            if device_file:
                with open(os.path.expanduser('~/.config/kmonad/config.kbd'), 'r') as f:
                    config = f.read()
                config = config.replace(device_name, f'/dev/input/{device_file}')
                with open(os.path.expanduser('~/.config/kmonad/config.kbd'), 'w') as f:
                    f.write(config)
            break
END_PYTHON
fi
systemctl --user restart kmonad
if systemctl --user is-active --quiet kmonad; then
  notify-send "Successfully switched to keyboard $(basename ${chosen_keyboard})"
else
  notify-send "Kmonad isn't running as expected, check the status"
fi
