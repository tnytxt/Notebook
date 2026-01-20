# Systemd Disable & Re-enable Services

 "avahi-daemon" used as an example.
 
 To disable, stop, mask immediately use **--now** 
 e.g. 
 
```
systemctl stop --now avahi-daemon
```

- List loaded services:
systemctl list-units --type=service
- List loaded services inc. disabled:
systemctl list-unit-files --type=service
- List active or failed:
systemctl --state=active,failed --type=service

- Show status: 
sudo systemctl status avahi-daemon  

- Stop: 
sudo systemctl stop avahi-daemon  

- Disable: 
sudo systemctl disable avahi-daemon 

- Mask: (so it cant start manual or auto) 
sudo systemctl mask avahi-daemon 

- Verify the status and logs:: 
sudo systemctl status avahi-daemon 
sudo journalctl -u avahi-daemon.service

- Re-enable: 
sudo systemctl unmask avahi-daemon 
sudo systemctl enable avahi-daemon 
sudo systemctl start avahi-daemon 

- List masked services: 
systemctl list-units --all | grep masked 

- View logs: 
journalctl -u avahi-daemon 

- Delete service file:
sudo rm /etc/systemd/system/<service>.service

- Refresh services:
sudo systemctl daemon-reload
