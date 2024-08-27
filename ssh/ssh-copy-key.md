

## 生成本地isa秘钥对
```shell
ssh-keygen -t rsa
```

## 方法一: 本地加一下目标机 hostsname 再手动发。
```shell
// add name like: T100 192.168.1.100
for i in {1..252}; do echo "192.168.1.$i a$i" >> /etc/hosts; done

// 发送公钥 (need to password the first time)
ssh-copy-id xx@Txx(xx@xx.xx.xx.xx)
```

## 方法二： 

1. 在目标机上安装依赖
```shell
sudo apt install expect
```
1. 发送 ssh_copy_id_expect 和 ssh_copy_id.sh 到目标机器，修改一下脚本参数，运行 ssh_copy_user.sh
2. 测试并统计一下情况: ./ssh_test.sh

3. 在获得 user 控制权的前提下，如果继续想要发送 key 给 root，可以继续使用 ssh_copy_root.sh 脚本, 写了通过 user 的 key 和 user 的 passwd 两种方式来发送 key 给 root。


## 方法三：

通过 ansible 来设置。见 ansible ssh-copy-key 目录。