#!/bin/bash

controller_connected=$(bluetoothctl info 84:30:95:86:12:EB | grep "Connected: yes")

if [[ ${controller_connected} == "" ]]; then
	exit 1
fi
exit 0
