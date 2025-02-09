#!/bin/bash

while ! ip route | grep -q default; do
	echo "waiting for default route to become available ..."
	sleep 1
done

