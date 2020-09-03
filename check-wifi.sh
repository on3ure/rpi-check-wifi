#!/bin/bash

ip=$(ip ro li | grep default | awk '{ print $3 }');

ping -c4 $ip > /dev/null

if [ $? != 0 ]
then
  echo "No network connection, restarting wlan0"
  /sbin/ifdown 'wlan0'
  sleep 5
  /sbin/ifup --force 'wlan0'
fi

