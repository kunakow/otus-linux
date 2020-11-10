#!/bin/bash
mdadm --create --verbose /dev/md0 -l10 -n4 /dev/sd{a,b,c,d,e}
mkdir /etc/mdadm
echo "DEVICE partitons" > /etc/mdadm/mdadm.conf
mdadm --detail --scan --verbose | awk '/ARRAY/ {print}' >> /etc/mdadm/mdadm.conf
