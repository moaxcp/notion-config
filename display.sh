#!/usr/bin/env bash
Xephyr :3 -br -reset -terminate -fp $(xset q | grep "Font Path:" -A1 | tail -n1) -resizeable &
sleep 10s
DISPLAY=:3.0 notion &
