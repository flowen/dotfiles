#!/usr/bin/env bash

# Get total used memory in MB using vm_stat on macOS
TOTALMEM=$(vm_stat | grep "Pages active\|Pages wired" | awk '{sum += $3} END {printf "%.0fMB", sum * 4096 / 1024 / 1024}')

sketchybar -m --set $NAME label="$TOTALMEM"