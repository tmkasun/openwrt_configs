#!/usr/bin/env bash

echo "Transfering openvpn config . . ."
scp openvpn root@192.168.1.1:/etc/config/openvpn

echo "Transfering firewall config . . ."
scp firewall root@192.168.1.1:/etc/config/firewall


echo "Transfering network config . . ."
scp network root@192.168.1.1:/etc/config/network


echo "Transfering tunnelbear_configs . . ."
scp -r tunnelbear_configs/* root@192.168.1.1:/etc/openvpn/


echo "Transfering mwan3 . . ."
scp ../mwan3 root@192.168.1.1:/etc/config/mwan3