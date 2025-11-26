#!/usr/bin/env python3

"""
What the hell is this?

When running the uplay version of Splinter Cell Double Agent on linux in xwayland, the scdalauncher does not render
correctly and is completely black. If I try to launch the singleplayer (SCDA-Offline) directly, it instantly crashes.
If I run it using wine-wayland, the launcher is rendered correctly, but the game crashes instantly.

The easiest solution was to blindly click on the singleplayer button in the incorrectly rendered launcher, then the
game works ok (except some graphical glitches that can be mostly fixed by tweaking the settings).

To solve this problem, I wrote this short script that waits for the scdalauncher to appear, then it clicks the
singleplayer button and exits.

Requirements:
- hyprland (uses hyprctl to detect the window)
- ydotool (used to click the button)
"""

import json
import subprocess
import time

GAME_TITLE = "Tom Clancy's SplinterCell 4"

LAUNCHER_CLASS = "steam_app_0".lower()
LAUNCHER_TITLE = "Tom Clancy's Splinter Cell : Double Agent".lower()
LAUNCHER_SIZE = [640, 360]

TARGET_POS = (365, 210)
"""Approximate position of the `singleplayer` button relative to the window."""


def start_ydotoold() -> subprocess.Popen:
    return subprocess.Popen(["ydotoold"])


def get_window_info():
    """Get window info from hyprctl"""
    result = subprocess.run(["hyprctl", "clients", "-j"], capture_output=True, text=True)
    clients = json.loads(result.stdout)

    return next(
        (
            client
            for client in clients
            if client["title"].lower() == LAUNCHER_TITLE and client["class"].lower() == LAUNCHER_CLASS
        ),
        None,
    )


def click_at_position(x, y):
    """Click at absolute screen position using ydotool"""
    subprocess.run(["ydotool", "mousemove", "-a", str(x), str(y)])
    time.sleep(0.1)
    subprocess.run(["ydotool", "click", "0xC0"])


def main():
    daemon = start_ydotoold()

    print("Waiting for Splinter Cell launcher window...")

    # Wait for window to appear
    window = None
    for _ in range(120):
        window = get_window_info()
        if window:
            print(f"Found window: {window['title']}")
            break
        time.sleep(0.5)

    if not window:
        print("Window not found!")
        return

    # Get window position and size
    x, y = window["at"]
    width, height = window["size"]

    print(f"Window at: {x}, {y} | Size: {width}x{height}")

    # Calculate button position
    button_x = x + TARGET_POS[0]
    button_y = y + TARGET_POS[1]

    print(f"Clicking at: {button_x}, {button_y}")
    time.sleep(1)  # Wait a bit for window to fully load

    click_at_position(button_x, button_y)
    print("Clicked!")

    daemon.terminate()
    daemon.wait()


if __name__ == "__main__":
    main()
