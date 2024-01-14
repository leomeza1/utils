#!/bin/bash

### Pop!_OS 22.04 LTS
echo "Removing btusb module..."
sudo rmmod btusb

echo "Loading btusb module..."
sudo modprobe btusb

