#!/bin/bash

# 检查expect是否安装
if ! command -v expect &> /dev/null; then
    echo "expect 未安装。请安装expect后再运行此脚本。"
    exit 1
fi

# 设置变量
SSH_KEY="/home/owner/.ssh/id_rsa.pub"
USER="xw"
PASSWORD="admin123"
START_IP=51
END_IP=60

# 循环遍历IP范围
for i in $(seq $START_IP $END_IP); do
    IP="192.168.1.$i"
    echo "Connecting to $IP..."
    
    # 使用expect来自动化ssh-copy-id过程
    expect -c "
    set timeout 30
    spawn ssh-copy-id -i $SSH_KEY $USER@$IP
    expect {
        \"*yes/no*\" {send \"yes\r\"; exp_continue}
        \"*password:*\" {send \"$PASSWORD\r\"}
    }
    expect {
        \"*密钥已经存在*\" {puts \"密钥已经存在于 $IP\"; exit 0}
        \"*现在可以登录*\" {puts \"成功复制密钥到 $IP\"; exit 0}
        \"*Permission denied*\" {puts \"密码错误或权限被拒绝，跳过 $IP\"; exit 1}
        timeout {puts \"连接到 $IP 超时，跳过\"; exit 1}
    }
    "
    
    # 检查expect的退出状态
    if [ $? -eq 0 ]; then
        echo "成功处理 $IP"
    else
        echo "处理 $IP 时出错，跳过"
    fi
    
    echo "------------------------"
done

echo "batch ssh-copy-id done."