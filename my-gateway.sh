#!/bin/bash

gateway=$(/sbin/ip ro li | /bin/grep default | /usr/bin/awk '{ print $3 }')

while [ -z "$gateway" ]
do
 echo "Seeking gateway"
 sleep 5
 gateway=$(/sbin/ip ro li | /bin/grep default | /usr/bin/awk '{ print $3 }')
done

echo $gateway > /var/log/gateway
