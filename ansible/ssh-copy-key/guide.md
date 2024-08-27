
## 通过ansible来设置 ssh-copy-id


1. 关闭公钥认证，编辑 /etc/ansible/ansible.cfg 配置文件
```shell
[defaults]
host_key_checking = False
```

2. 编辑 /etc/ansible/hosts 文件添加服务器信息如

指定ip段、目标机器user、本地key绝对路径、目标机器密码。
前提要先发送key到目标机器的 root 用户下, 见 ssh-copy-key.md 文档。

```shell
sudo vim /etc/ansible/hosts

[all]
192.168.1.2 ansible_ssh_user="root"
192.168.1.[10:100] ansible_ssh_user="root"
```

3. 编辑 push-key.yml 并运行
```shell
ansible all push-key.yml
```

4. 或者 ansible 直接 cmd
```shell
ansible all -m authorized_key -a "user=root state=present key='{{ lookup('file', '~/.ssh/id_rsa.pub') }}'" --become
```