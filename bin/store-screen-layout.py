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

def store_layout():
    with open(MONITOR_FILE, "r") as f:
        monitors = json.load(f)

    active_monitors = get_active_monitors()

    for line in active_monitors:
        content = line.split()
        monitor = content[0]
        monitors[monitor] = content[2:]

    with open(MONITOR_FILE, "w") as f:
        json.dump(monitors, f)

def restore_layout():
    with open(MONITOR_FILE, "r") as f:
        monitors = json.load(f)

    active_monitors = get_active_monitors()
    active_monitor_names = [line.split()[0] for line in active_monitors]

    command = ["xrandr"]

    for monitor_name in active_monitor_names:
        if monitor_name not in monitors:
            print("Monitor {} not found in stored layout".format(monitor_name))
            continue
        monitor_mode = monitors[monitor_name]
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
