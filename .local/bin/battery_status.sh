#!/bin/bash

# Get battery percentage
battery_percentage=$(upower -i $(upower -e | grep BAT) | grep percentage | awk '{print $2}')

# Get battery status (e.g. charging, discharging, fully charged)
battery_status=$(upower -i $(upower -e | grep BAT) | grep state | awk '{print $2}')

echo "$battery_percentage - $battery_status"

