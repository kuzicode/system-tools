#!/bin/bash

export ENABLE_PROVE_RECYCLE=1;
# gpu 0,1,2,3 for 4 lines
nohup taskset -c 0-27 ./aleo-prover-chux -g 0 -j 48 -t 2 -a aleo1xdmhxryr4uxgneecncaq5r5xhng4c0js5y2h07v2z44h9pdr7yrqu0yhd6 -p 180.119.136.20:4132 > gpu-0.log 2>&1 &
nohup taskset -c 56-83 ./aleo-prover-chux -g 1 -j 48 -t 2 -a aleo1xdmhxryr4uxgneecncaq5r5xhng4c0js5y2h07v2z44h9pdr7yrqu0yhd6 -p 180.119.136.20:4132 > gpu-0.log 2>&1 &
nohup taskset -c 28-55 ./aleo-prover-chux -g 2 -j 48 -t 2 -a aleo1xdmhxryr4uxgneecncaq5r5xhng4c0js5y2h07v2z44h9pdr7yrqu0yhd6 -p 180.119.136.20:4132 > gpu-0.log 2>&1 &
nohup taskset -c 84-111 ./aleo-prover-chux -g 3 -j 48 -t 2 -a aleo1xdmhxryr4uxgneecncaq5r5xhng4c0js5y2h07v2z44h9pdr7yrqu0yhd6 -p 180.119.136.20:4132 > gpu-0.log 2>&1 &