

# check ufw
```
// 在ufw防火墙中添加允许ssh的规则
sudo ufw allow port /tcp

sudo ufw allow 22
sudo ufw allow ssh
sudo ufw reload
sudo ufw status

// edit config
sudo apt install arping
```


# change passwd

```
sudo passwd root
```

# config 

1. sshd_config
```
vim /etc/ssh/sshd_config

// PermitRootLogin yes
// PasswordAuthentication yes

or use sed
sudo sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config;
sudo sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config;

```

2. add rsa key
```
ubuntu22.04取消了rsa sha1登录，导致原来的证书已无法登录

HostKeyAlgorithms +ssh-rsa
PubkeyAcceptedKeyTypes +ssh-rsa

sudo sh -c "echo 'HostKeyAlgorithms +ssh-rsa' >> /etc/ssh/sshd_config"
sudo sh -c "echo 'PubkeyAcceptedKeyTypes +ssh-rsa' >> /etc/ssh/sshd_config"
sudo systemctl restart sshd
```


3. gdm-autologin 桌面环境root登录
```
vim /etc/pam.d/gdm-autologin
// 去掉# 
auth  required        pam_succeed_if.so user != root quiet_success

vim /root/.profile
将：mesg n 2＞ /dev/null || true
改为：tty -s && mesg n || true
```


# test

```
// restart
sudo service sshd restart

// connect test
ssh root@localhost
```
hd restart
```