#!/bin/bash
sudo apt-get install libnl-genl-3-dev libkeyutils-dev bison flex
sudo apt purge lustre-client-modules-5.4.0-96-generic
sudo apt-get install ~/scripts/geniac-gcp-setup/modules/lustre-client-modules-5.15.0-1008-gcp-tcpx_2.15.62-22-gf2868d1-1_amd64.deb
sudo modprobe lustre
sudo mkdir -p /lustre && sudo mount -t lustre 172.16.0.29:/lustre /lustre
