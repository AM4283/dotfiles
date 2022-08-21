#!/usr/bin/env bash

# udev will wait for our script to finish before the monitor is available
# for use, so we will use the `at` command to run our command again as
# another user:
if [ "$1" != "forked" ]; then
    echo "$(dirname $0)/$(basename $0) forked" | at now
    exit
fi


# udev runs as root, so we need to tell it how to connect to the X server:
export DISPLAY=:0
export XAUTHORITY=$HOME/.Xauthority


# Find out the device path to our graphics card:
cardPath=/sys/$(udevadm info -q path -n /dev/dri/card1)

conID=$(xrandr | sed -n '/DP-1-0 connected/p' | awk '{print $1}')
if [ -z "$conID" ]; then
  conID=$(xrandr | sed -n '/DP-1-2 connected/p' | awk '{print $1}')
fi

if [ "$(cat $cardPath/card1-DP-3/status)" == "connected" ]; then
  shaID=$(sha1sum $cardPath/card1-DP-3/edid | cut -f1 -d " ")
elif [ "$(cat $cardPath/card1-DP-4/status)" == "connected" ]; then
  shaID=$(sha1sum $cardPath/card1-DP-4/edid | cut -f1 -d " ")
fi

echo $conID
echo $shaID

# The useful part: check what the connection status is, and run some other commands
if [ -n "$conID" ]; then
    if [ "$shaID" = "a9cd085387707f817631f45eeb1774117baeaafd" ]; then    # AOC27in
        xrandr --output $conID --primary --mode 1920x1080 --rate 144.0 --left-of eDP --rotate normal
        # sleep 1
        # kill -HUP $(pidof dwm)
    # else                                            # Probably a projector
    #   xrandr --output eDP1 --auto --output HDMI1 --auto --same-as eDP1
    fi
else
    xrandr --output DP-1-2 --off --output DP-1-0 --off
    # kill -HUP $(pidof dwm)
fi
light -s sysfs/backlight/nvidia_wmi_ec_backlight -S $(light)

# xrandr --output eDP --mode 1920x1080_60.00 --pos 1920x0 --rotate normal --output DisplayPort-0 --off --output DisplayPort-1 --off --output DP-1-0 --primary --mode 1920x1080 --rate 144.0 --pos 0x0 --rotate normal --output DP-1-1 --off --output DP-1-2 --off --output DP-1-3 --off --output DP-1-4 --off
