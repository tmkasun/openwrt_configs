#!/usr/bin/env bash

echo "Syncing autoipset . . ."
scp root@192.168.1.1:/etc/init.d/autoipset .


echo "Syncing dnsmasq.conf . . ."
scp root@192.168.1.1:/etc/dnsmasq.conf .


echo "Syncing mwan3 . . ."
scp root@192.168.1.1:/etc/config/mwan3 .