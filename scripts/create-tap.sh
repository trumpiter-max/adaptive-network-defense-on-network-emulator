#!/bin/bash
# use tap to help bare metal machine join in gns3 network as host
sudo ip tuntap add name tap0 mode tap 
sudo ip addr add 10.10.10.10/24 dev tap0
sudo ip link set dev tap0 up
ip addr | grep tap0