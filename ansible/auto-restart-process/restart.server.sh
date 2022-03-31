#!/bin/bash

num=`grep keyword | wc -l`
echo $num

if [ $num -lt 1 ]
then
        systemctl restart miner-xhv
fi