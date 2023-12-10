#!/bin/bash
#
# Listen for when programs ask systemd to start/stop user services
# and attempt to start/stop a dinit service with the same name.
#
# Written by Bob Funk.

# Location for user services:
userdir="$HOME/.config/dinit.d/"

# Monitor loop for org.freedesktop.systemd1.Manager:
get_srv=0
srv_cmd=""
dbus-monitor --session "destination='org.freedesktop.systemd1',interface='org.freedesktop.systemd1.Manager'" | while read -r line
do
  if [ "$get_srv" = "1" ]; then
    # Extract service name, which is on line following StartUnit/StopUnit:
    srv="$(echo $line | cut -d\" -f 2 | sed 's/\.service//g')"
    if ! /sbin/dinitctl "$srv_cmd" "$srv" 2> /dev/null; then
      echo "Failed to start $srv"
    fi
    get_srv=0
    srv_cmd=""
  elif echo "$line" | grep -q 'StartUnit' ; then
    get_srv=1
    srv_cmd="start"
  elif echo "$line" | grep -q 'StopUnit' ; then
    get_srv=1
    srv_cmd="stop"
  fi
done
