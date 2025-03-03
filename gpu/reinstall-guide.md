

# install

```shell
sudo apt install gcc g++ make

// 卸载系统里的Nvidia低版本显卡驱动
sudo apt purge *nvidia* -y
sudo apt --purge remove "*nvidia*" -y
sudo apt autoremove -y

// 把显卡驱动加入PPA
sudo add-apt-repository ppa:graphics-drivers
sudo apt update

// 查找显卡驱动最新的版本号
sudo apt-cache search nvidia

// 使用终端命令查看Ubuntu推荐的驱动版本
sudo ubuntu-drivers devices
 
// 安装Nvidia驱动 假设我们想装470的版本
sudo apt install nvidia-driver-470 -y

// 重启
sudo reboot

// 验证驱动是否安装成功
nvidia-smi
```

# install cuda

```shell
wget https://developer.download.nvidia.com/compute/cuda/11.8.0/local_installers/cuda_11.8.0_520.61.05_linux.run
```

# remove

```shell
sudo /usr/bin/nvidia-uninstall
```