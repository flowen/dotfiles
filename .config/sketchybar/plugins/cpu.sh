#!/usr/bin/env bash

# Simpler and more reliable CPU calculation
CPU_USAGE=$(top -l 2 -n 0 -s 0 | grep "CPU usage" | tail -1 | awk '{print $3}' | tr -d '%')

sketchybar -m --set cpu_percent label="${CPU_USAGE}%"