#!/bin/sh

pactl get-sink-volume \
    @DEFAULT_SINK@ \
    | awk -F '[^0-9]+' '/front-left:/{print $3}'
