### Install instructions
- On your TrueNAS server shell, enter the jail  
`# iocage console [jailname]`

- Download and extract this project's source  
```
# cd /tmp
# curl -L https://github.com/kauedg/TrueNAS-Transmission-OpenVPN/archive/refs/heads/master.zip | unzip -
# cd TrueNAS-Transmission-OpenVPN-master/
```

- Build it  
`# make`

- Start it
`# service openvpn start`

### Logs
- OpenVPN: `/var/log/openvpn.log`
- Transmission: `/var/log/messages`
