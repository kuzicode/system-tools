#!/bin/bash

# 检查 expect 是否安装
if ! command -v expect &> /dev/null; then
    echo "expect 未安装。请安装 expect 后再运行此脚本。"
    exit 1
fi

# 设置变量
USER="xw"
PASSWORD="admin123"
ROOT_PASSWORD="admin123"  # 请替换为实际的 root 密码
START_IP=57
END_IP=111
PUBLIC_KEY_FILE="/home/owner/.ssh/id_rsa.pub"

# 检查公钥文件是否存在
if [ ! -f "$PUBLIC_KEY_FILE" ]; then
    echo "公钥文件 $PUBLIC_KEY_FILE 不存在。请检查文件路径。"
    exit 1
fi

# 读取公钥
PUBLIC_KEY=$(cat "$PUBLIC_KEY_FILE")

# 创建 expect 脚本
cat << EOF > add_root_ssh_key.exp
#!/usr/bin/expect -f

set timeout 30
set host [lindex \$argv 0]
set user $USER
set password $PASSWORD
set root_password $ROOT_PASSWORD
set public_key {$PUBLIC_KEY}

spawn ssh \$user@\$host

expect {
    "yes/no" { send "yes\r"; exp_continue }
    "password:" { send "\$password\r" }
}

expect "\$ "
send "sudo -i\r"
expect {
    "password for $USER:" { send "\$password\r" }
}

expect "# "
send "mkdir -p /root/.ssh\r"
expect "# "
send "touch /root/.ssh/authorized_keys\r"
expect "# "
send "chmod 700 /root/.ssh\r"
expect "# "
send "chmod 600 /root/.ssh/authorized_keys\r"
expect "# "
send "echo '\$public_key' >> /root/.ssh/authorized_keys\r"
expect "# "
send "exit\r"

expect "\$ "
send "exit\r"
expect eof
EOF

chmod +x add_root_ssh_key.exp

# 循环处理每个 IP
for i in $(seq $START_IP $END_IP); do
    IP="192.168.1.$i"
    echo "正在处理 $IP..."
    
    ./add_root_ssh_key.exp "$IP"
    
    if [ $? -eq 0 ]; then
        echo "成功添加公钥到 $IP 的 root 用户"
    else
        echo "添加公钥到 $IP 的 root 用户时出错"
    fi
    
    echo "------------------------"
done

# 清理临时文件
rm add_root_ssh_key.exp

echo "批量添加 root 公钥操作完成"