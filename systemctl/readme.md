

# deploy

```shell
sudo vim /etc/systemd/system/ollama.service

sudo systemctl daemon-reload
sudo systemctl restart ollama
```


# watch and debug

```shell
journalctl -u ollama -f
```