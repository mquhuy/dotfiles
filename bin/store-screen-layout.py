#!/usr/bin/env python3

import subprocess
import json
import re
import os
import sys

MONITOR_FILE = os.path.join(os.environ["HOME"], ".screenlayout", "monitors.json")
BASE_COMMAND = ["i3-msg", "-t"]

def load_layout():
    if os.path.exists(MONITOR_FILE):
        with open(MONITOR_FILE, "r") as f:
            return json.load(f)
    else:
        return {}

def save_layout(layout):
    with open(MONITOR_FILE, "w") as f:
        json.dump(layout, f, indent=4, sort_keys=True)

def get_workspaces():
    workspaces = json.loads(subprocess.check_output(BASE_COMMAND + ["get_workspaces"]).decode("utf-8"))
    return workspaces

def get_workspaces_by_outputs():
    workspaces = get_workspaces()
    data = {}
    for workspace in workspaces:
        data[workspace["output"]] = data.get(workspace["output"], []) + [workspace["num"]]
    return data

def get_active_monitors():
    active_monitors=json.loads(subprocess.check_output(BASE_COMMAND + ["get_outputs"]).decode("utf-8"))
    active_monitors = [monitor for monitor in active_monitors if monitor["name"] != "xroot-0"]
    workspaces_by_monitors = get_workspaces_by_outputs()
    data = {}
    for monitor in active_monitors:
        name = monitor["name"]
        monitor.update(workspaces=workspaces_by_monitors.get(name, []))
        data[name] = monitor
    return data

def get_setup_name():
    active_monitors=get_active_monitors()
    name = "-".join([monitor["name"] for monitor in active_monitors.values()])
    return name

def set_display_off_with_filter(filter=[]):
    # Only keep the screens that are in the filter
    store_layout()
    active_monitors = get_active_monitors()
    for name in active_monitors:
        if name in filter:
            continue
        command = ["xrandr", "--output", name, "--off"]
        subprocess.run(command)

def set_laptop_mode():
    set_display_off_with_filter(["eDP-1"])

def set_zero_mode():
    set_display_off_with_filter([])

def store_layout():
    monitors = load_layout()

    active_monitors = get_active_monitors()
    setup_name = get_setup_name()

    monitors[setup_name] = active_monitors
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
    workspaces = get_workspaces()
    workspace_nums = [ws["num"] for ws in workspaces]
    print(workspace_nums)

    for name in active_monitors:
        if name not in setup_info:
            print("Monitor {} not found in stored layout".format(name))
            set_laptop_mode()
            return
        monitor = setup_info[name]
        command = ["xrandr"]
        monitor_info = setup_info[name]
        command += ["--output", name]
        if monitor_info["primary"]:
            command += ["--primary"]
        monitor_mode = monitor_info["rect"]
        command += ["--mode", f"{monitor_mode['width']}x{monitor_mode['height']}", "--pos", f"{monitor_mode['x']}x{monitor_mode['y']}"]
        if len(command) > 1:
            print(command)
            subprocess.run(command)
        if monitor == "eDP-1":
            continue
        for workspace in monitor["workspaces"]:
            if workspace in workspace_nums:
                command = ["i3-msg", "move", "workspace", "number", str(workspace), "to", "output", monitor["name"]]
                print(command)
                subprocess.run(command)

if __name__ == "__main__":
    if sys.argv[1] == "store":
        store_layout()
    elif sys.argv[1] == "restore":
        restore_layout()
    elif sys.argv[1] == "laptop":
        set_laptop_mode()
    elif sys.argv[1] == "off":
        store_layout()
        set_zero_mode()
