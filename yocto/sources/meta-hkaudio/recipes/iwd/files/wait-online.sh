#!/bin/bash

while ! ip route | grep -q default; do
	echo "waiting for default route to become available ..."
	sleep 1
done

while ! timedatectl | grep -q 'System clock synchronized: yes'; do
	echo "waiting for time to be synchronized ..."
	sleep 1
done
