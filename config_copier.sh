#!/usr/bin/env bash

echo "Transfering autoipset . . ."
scp autoipset root@192.168.1.1:/etc/init.d/autoipset


echo "Transfering dnsmasq.conf . . ."
scp dnsmasq.conf root@192.168.1.1:/etc/dnsmasq.conf


echo "Transfering mwan3 . . ."
scp mwan3 root@192.168.1.1:/etc/config/mwan3