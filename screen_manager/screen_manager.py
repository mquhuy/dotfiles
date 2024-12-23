#!/home/huy/dotfiles/screen_manager/venv/bin/python

import subprocess
import os
import re
import itertools
import sys
from rofi import Rofi

LAYOUT_FILE = os.path.join(os.environ["HOME"], ".config", ".screenlayout")
ON_WAYLAND = False
COMMAND = "wlr-randr"
SIZE_REGEX = r"(?P<width>\d+)x(?P<height>\d+) px, .* Hz \("
if not "WAYLAND_DISPLAY" in os.environ:
    ON_WAYLAND = False
    COMMAND = "xrandr"
    SIZE_REGEX = r"(?P<width>\d+)x(?P<height>\d+) "

def get_screens():
    if not ON_WAYLAND:
        out = subprocess.check_output([COMMAND, "--verbose"])
    else:
        out = subprocess.check_output([COMMAND])
    # screens = re.split("Adaptive Sync: \w+\n", out.decode())
    screens = re.split(r'(?m)^(?!\s)', out.decode())
    all_screens = {}
    for screen in screens:
        if (not ON_WAYLAND) and ('disconnected' in screen or 'Screen' in screen):
            continue
        screen_dict = {}
        screen = screen.strip()
        if screen == "":
            continue
        lines = screen.splitlines()
        if len(lines) == 0:
            continue
        names = lines[0].split()
        if len(names) == 0:
            continue
        screen_dict["name"] = names[0]
        for idx, line in enumerate(lines):
            line = line.strip()
            items = line.split(": ")
            if len(items) == 2:
                screen_dict[items[0]] = items[1]
                continue
            match = re.search(SIZE_REGEX, line)
            if match is None or "width" in screen_dict:
                continue
            screen_dict["width"] = int(match.group("width"))
            screen_dict["height"] = int(match.group("height"))
            print(line)
        if "Make" in screen_dict:
            screen_name = f'{screen_dict["Make"]}-{screen_dict["Model"]}'
        else:
            screen_name = screen_dict["name"]
        all_screens[screen_name] = screen_dict
    return all_screens

def run_command(command):
    print(f"Running: {' '.join(command)}")
    subprocess.run(command)

def set_screen_position(screen, location):
    screen_name = screen["name"]
    command = [COMMAND, "--output", screen_name]
    loc_str = f"{location[0]}x{location[1]}"
    if ON_WAYLAND:
        r = run_command(command + ["--on"])
        loc_str = f"{location[0]},{location[1]}"
    else:
        run_command(command + ["--mode", f"{screen['width']}x{screen['height']}"])
    r = run_command(command + ["--pos", loc_str])

def turn_screen_off(screen_name):
    command = [COMMAND, "--output", screen_name, "--off"]
    subprocess.run(command)

def organize_screens(layout):
    screen_names = layout.split(" - ")
    x = 0
    screens = get_screens()
    for name in screen_names:
        screen = screens[name]
        set_screen_position(screen, (x, 0))
        x += screen["width"]
    store_layout(layout)

def get_layout_options():
    screens = get_screens()
    permutations = list(itertools.permutations(screens))
    options = [" - ".join(per) for per in permutations]
    return options

def choose_screen_layout():
    options = get_layout_options()
    if len(options) == 1:
        organize_screens(options[0])
        return
    r = Rofi()
    index, key = r.select('Choose a layout:', options)
    if index != -1:
        organize_screens(options[index])
    else:
        print('No selection made.')

def store_layout(layout):
    with open(LAYOUT_FILE, "w") as f:
        f.write(layout)

def restore_layout():
    if not os.path.exists(LAYOUT_FILE):
        options = get_layout_options()
        organize_screens(options[0])
    with open(LAYOUT_FILE) as f:
        layout = f.read()
        organize_screens(layout)

def is_screen_on():
    screens = get_screens()
    for screen in screens.values():
        if screen["Enabled"] == "yes":
            return True
    return False

def toggle():
    screens = get_screens()
    if is_screen_on():
        for screen in screens.values():
            turn_screen_off(screen["name"])
        return
    restore_layout()

def main(argv):
    if len(argv) == 0:
        choose_screen_layout()
    elif argv[0] == "restore":
        restore_layout()
    elif argv[0] == "toggle":
        toggle()

if __name__ == "__main__":
    main(sys.argv[1:])
