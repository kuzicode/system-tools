#!/bin/bash

successful=0
failed=0
failed_ips=()

# 1. 这里指定目标机器的IP段
for i in {174..220}
do
    ip="192.168.1.$i"
    echo "Testing connection to $ip"
    # 2. 这里指定目标机器的用户名
    if ssh -o BatchMode=yes -o ConnectTimeout=5 xw@$ip echo "Connection successful" &> /dev/null
    then
        echo "Connection Successful."
        ((successful++))
    else
        echo "Connection FFFFailed!"
        ((failed++))
        failed_ips+=($ip)
    fi
done

echo "------- Results -------"
echo "Successful counts: $successful"
echo "Failed coounts: $failed"
echo "Failed IPs:"
printf '%s\n' "${failed_ips[@]}"