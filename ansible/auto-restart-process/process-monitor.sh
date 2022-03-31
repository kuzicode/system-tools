#!/bin/bash
# crontab + shell scripts
# crontab -e
# */1 * * * * /home/process-monitor.sh
proc_name="xxx"
proc_num()
{
        num=`ps -ef | grep $proc_name | grep -v grep | wc -l`
        return $num
}
proc_num
number=$?
echo $number
if [ $number -eq 0 ]
then
        nohup $HOME/ironfish/ironfish/ironfish-cli/bin/ironfish-node start > logs/node.log 2>&1 &
fi