#!/bin/bash

sudo apt --purge remove nvidia* -y
sudo apt autoremove -y
sudo apt --purge remove "*cublas*" "cuda*" -y
sudo apt --purge remove "*nvidia*" -y
# sudo apt install  nvidia-driver-535 -y
./cuda_11.8.0_520.61.05_linux.run --silent --override-driver-check