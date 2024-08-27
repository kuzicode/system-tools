#!/bin/bash

curl https://dl.google.com/go/go1.22.1.linux-amd64.tar.gz | sudo tar -C/usr/local -zxvf - ;

mkdir $HOME/go
echo "GOPATH=$HOME/go" >> $HOME/.bashrc
echo "export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin" >> $HOME/.bashrc
echo "export GOROOT=/usr/local/go" >> $HOME/.bashrc
echo "export GOPROXY=https://goproxy.cn" >> $HOME/.bashrc
source $HOME/.bashrc
go version