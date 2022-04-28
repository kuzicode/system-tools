


## cmd
```
// create raid0
mdadm -C /dev/md127 -l raid0 -n 8 /dev/nvme0n1 /dev/nvme1n1 /dev/nvme2n1 /dev/nvme3n1 /dev/nvme4n1 /dev/nvme5n1 /dev/nvme6n1 /dev/nvme7n1

// format and mount
sudo mkfs.ext4 /dev/md127
mount /dev/md127 /nvme

// stop raid0
mdadm -S /dev/md127

// check info
cat /proc/mdstat
```

## auto mount
```
// check uuid
blkid /dev/md127

// wr config
vim /etc/fstab
/dev/disk/by-uuid/467709e7-abef-44b5-908f-c866094e2193 /dev/md127 ext4 defaults 0 0
```


## reference
```
// create
https://blog.csdn.net/qq_44895681/article/details/105657604
// stop
https://blog.51cto.com/u_13347409/1968003
```