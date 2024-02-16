#!/usr/bin/env python3

import subprocess
import json
import re
import os
import sys

MONITOR_FILE = os.path.join(os.environ["HOME"], ".screenlayout", "monitors.json")

def load_layout():
    if os.path.exists(MONITOR_FILE):
        with open(MONITOR_FILE, "r") as f:
            return json.load(f)
    else:
        return {}

def save_layout(layout):
    with open(MONITOR_FILE, "w") as f:
        json.dump(layout, f, indent=4, sort_keys=True)

class Monitor:
    def __init__(self, connect_line, mode_line):
        connect_content = connect_line.split()
        self.name = connect_content[0]
        self.mode = connect_content[2:]
        self.identity = mode_line.strip().split()[0]

def get_active_monitors():
    active_monitor_output=subprocess.check_output(["xrandr"]).decode("utf-8").split("\n")
    active_monitors=[]
    for idx, line in enumerate(active_monitor_output):
        if re.match("^\S+ connected", line):
            active_monitors.append(Monitor(line, active_monitor_output[idx+1]))
    return active_monitors

def get_setup_name():
    active_monitors=get_active_monitors()
    name = "-".join([monitor.identity for monitor in active_monitors])
    return name

def set_display_off_with_filter(filter=[]):
    # Only keep the screens that are in the filter
    store_layout()
    command = ["xrandr", "--output", "eDP-1", "--mode", "1920x1200", "--pos", "0x0", "--primary", "--rotate", "normal"]
    subprocess.run(command)
    active_monitors = get_active_monitors()
    for monitor in active_monitors:
        if monitor.name in filter:
            continue
        command = ["xrandr", "--output", monitor.name, "--off"]
        subprocess.run(command)

def set_laptop_mode():
    set_display_off_with_filter(["eDP-1"])

def set_zero_mode():
    set_display_off_with_filter([])

def store_layout():
    monitors = load_layout()

    active_monitors = get_active_monitors()

    setup_info = {}

    for monitor in active_monitors:
        setup_info[monitor.identity] = monitor.mode

    setup_name = get_setup_name()

    monitors[setup_name] = setup_info
    save_layout(monitors)

def restore_layout():
    monitors = load_layout()

    setup_name = get_setup_name()
    if setup_name not in monitors:
        print("Setup {} not found in stored layout".format(setup_name))
        set_laptop_mode()
        return

    setup_info = monitors[setup_name]
    active_monitors = get_active_monitors()

    for monitor in active_monitors:
        if monitor.identity not in setup_info:
            print("Monitor {} not found in stored layout".format(monitor.name))
            set_laptop_mode()
            return
        command = ["xrandr"]
        monitor_mode = setup_info[monitor.identity]
        command += ["--output", monitor.name]
        idx = 0
        if monitor_mode[idx] == "primary":
            command += ["--primary"]
            idx += 1
        mode_info = monitor_mode[idx].split("+")
        command += ["--mode", mode_info[0], "--pos", mode_info[1] + "x" + mode_info[2]]
        if len(command) > 1:
            print(command)
            subprocess.run(command)

if __name__ == "__main__":
    if sys.argv[1] == "store":
        store_layout()
    elif sys.argv[1] == "restore":
        restore_layout()
    elif sys.argv[1] == "laptop":
        set_laptop_mode()
