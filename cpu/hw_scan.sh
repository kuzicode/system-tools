#!/bin/bash

echo "=== cpu ==="
cat /proc/cpuinfo |grep "model name" && cat /proc/cpuinfo |grep "physical id"

echo "=== mem === "
dmidecode -t memory | grep Size: | grep -v "No Module Installed"
sudo dmidecode -t memory | grep Manufacturer:

echo "=== disk ==="
lsblk
hdparm -i /dev/sda | grep Model=