#!/usr/bin/env bash

wget -c https://golang.google.cn/dl/go1.16.15.linux-amd64.tar.gz -O - | sudo tar -xz -C /usr/local


echo "GOPATH=$HOME/go" >> $HOME/.bashrc
echo "export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin" >> $HOME/.bashrc
# echo "export GOPROXY=https://goproxy.cn" >> $HOME/.bashrc

source $HOME/.bashrc
go version