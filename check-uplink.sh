#!/bin/bash

ip=$(cat /var/log/gateway)
uptime=$(printf "%.0f\n" $(cat /proc/uptime | /usr/bin/awk '{ print $1 }'))
delay=1800

if [ "$uptime" -gt "$delay" ];
then
        /bin/ping -c30 $ip > /dev/null

        if [ $? != 0 ]
        then
          echo "No network connection, rerbooting machine"
          /sbin/reboot
        fi
fi

