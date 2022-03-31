

## 生成本地isa秘钥对
```
ssh-keygen
```

## add hosts name
```
// add name like: T100 192.168.1.100
for i in {1..252}; do echo "192.168.1.$i T$i" >> /etc/hosts; done
```

## 简单的发送公钥(need to password the first time)
```
ssh-copy-id xx@Txx(xx@xx.xx.xx.xx)
```


## 通过ansible来设置
```
// 1. 关闭公钥认证，编辑 /etc/ansible/ansible.cfg 配置文件

[defaults]
host_key_checking = False

// 2. 编辑 /etc/ansible/hosts 文件添加服务器信息如
[all]
192.168.1.135 ansible_ssh_user="test" ansible_ssh_pass="admin123"
192.168.1.168 ansible_ssh_user="test" ansible_ssh_pass="admin123"
192.168.1.199 ansible_ssh_user="xw" ansible_ssh_pass="admin123"

// 3. 编辑 push-ssh-key.yml

// 4. 运行
ansible all push-ssh-key.yml
```