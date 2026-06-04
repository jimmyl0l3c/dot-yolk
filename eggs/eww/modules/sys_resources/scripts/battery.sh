#!/bin/sh

BAT_DIR="/sys/class/power_supply/BAT1"

CAPACITY_FILE=/sys/class/power_supply/BAT1/capacity
STATUS_FILE=/sys/class/power_supply/BAT1/status

check_battery() {
    CURR_CAPACITY=$(cat "$CAPACITY_FILE")
    CURR_STATUS=$(cat "$STATUS_FILE")

    jq --null-input -Mc \
        --argjson capacity $CURR_CAPACITY \
        --argjson status "\"${CURR_STATUS}\"" \
        '{bat_charge: $capacity, bat_status: $status, bat_charging: $status == "Charging"}'
}

check_battery

inotifywait -m $CAPACITY_FILE $STATUS_FILE

# TODO: replace this, inotifywait cannot be used with /sys files

while ! inotifywait -e modify $CAPACITY_FILE $STATUS_FILE ; do
    check_battery
done
