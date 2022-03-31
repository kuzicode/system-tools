


## cmd
```
// create raid0
mdadm -C /dev/md127 -l raid0 -n 4 /dev/nvme0n1 /dev/nvme1n1 /dev/nvme3n1 /dev/nvme2n1

// format and mount
sudo mkfs.ext4 /dev/md127
mount /dev/md127 /nvme

// stop raid0
mdadm -D /dev/md127

// check info
cat /proc/mdstat
```


## reference
```
// create
https://blog.csdn.net/qq_44895681/article/details/105657604
// stop
https://blog.51cto.com/u_13347409/1968003
```