#!/usr/bin/env python3

import subprocess
import json
import re
import os
import sys

MONITOR_FILE = os.path.join(os.environ["HOME"], ".screenlayout", "monitors.json")

def get_active_monitors():
    active_monitor_output=subprocess.check_output(["xrandr"]).decode("utf-8").split("\n")
    active_monitors=[line for line in active_monitor_output if re.match("^\S+ connected", line)]
    return active_monitors

def get_setup_name(active_monitors):
    setup_name = []
    for line in active_monitors:
        content = line.split()
        monitor = content[0]
        setup_name.append(monitor)
    name = "-".join(setup_name)
    print(name)
    return name


def set_laptop_mode():
    store_layout()
    command = ["xrandr", "--output", "eDP-1", "--mode", "1920x1200", "--pos", "0x0", "--primary", "--rotate", "normal"]
    subprocess.run(command)
    active_monitors = get_active_monitors()
    for line in active_monitors:
        content = line.split()
        monitor = content[0]
        if monitor == "eDP-1":
            continue
        command = ["xrandr", "--output", monitor, "--off"]
        subprocess.run(command)


def set_zero_mode():
    active_monitors = get_active_monitors()
    for line in active_monitors:
        content = line.split()
        monitor = content[0]
        command = ["xrandr", "--output", monitor, "--off"]
        subprocess.run(command)


def store_layout():
    with open(MONITOR_FILE, "r") as f:
        monitors = json.load(f)

    active_monitors = get_active_monitors()

    setup_info = {}

    for line in active_monitors:
        content = line.split()
        monitor = content[0]
        setup_info[monitor] = content[2:]

    setup_name = get_setup_name(active_monitors)

    monitors[setup_name] = setup_info

    with open(MONITOR_FILE, "w") as f:
        json.dump(monitors, f, indent=4, sort_keys=True)

def restore_layout():
    with open(MONITOR_FILE, "r") as f:
        monitors = json.load(f)

    active_monitors = get_active_monitors()
    active_monitor_names = [line.split()[0] for line in active_monitors]

    setup_name = get_setup_name(active_monitors)
    if setup_name not in monitors:
        print("Setup {} not found in stored layout".format(setup_name))
        set_laptop_mode()
        return

    setup_info = monitors[setup_name]

    for monitor_name in active_monitor_names:
        if monitor_name not in setup_info:
            print("Monitor {} not found in stored layout".format(monitor_name))
            set_laptop_mode()
            return
        command = ["xrandr"]
        monitor_mode = setup_info[monitor_name]
        command += ["--output", monitor_name]
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
