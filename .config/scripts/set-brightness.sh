#!/bin/sh

readonly SYSTEMD_BACKLIGHT_FILE='$HOME/.cache/.brightness'
# Backlight level from AMDGPU driver
readonly AMDGPU_BACKLIGHT_FILE='/sys/class/backlight/amdgpu_bl0/brightness'

# Read current value from the driver and apply it to systemd
readonly AMDGPU_BACKLIGHT_VALUE=$(cat "$SYSTEMD_BACKLIGHT_FILE")
echo "$AMDGPU_BACKLIGHT_VALUE" > "$AMDGPU_BACKLIGHT_FILE"
