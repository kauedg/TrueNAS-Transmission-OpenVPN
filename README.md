### Supported VPNs
Currently only NordVPN

### Install instructions
- On your TrueNAS server shell, enter the jail  
```shell
root@host $ iocage console [jailname]
```

- Download and extract this project's source  
```shell
root@jail $ cd /tmp
root@jail $ curl -L https://github.com/kauedg/TrueNAS-Transmission-OpenVPN/archive/refs/heads/master.zip | unzip -
root@jail $ cd TrueNAS-Transmission-OpenVPN-master/
```

- Build and install
```shell
root@jail $ make
```

- Check if the service is running at startup
```shell
root@jail $ exit
root@host $ iocage restart [jailname]
root@host $ iocage console [jailname]
root@jail $ service openvpn status
root@jail $ service transmission status
```

- If something goes wrong, check the log files:
  - OpenVPN:   
  `/var/log/openvpn.log`
  - Transmission:  
  `/var/log/messages`
