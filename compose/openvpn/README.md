# OpenVPN

https://blog.ambar.cloud/tutorial-set-up-openvpn-with-docker-compose/


```bash
# 1. Generate server certificate and config
docker-compose run --rm openvpn ovpn_genconfig -u udp://{vpn_server_address}

docker-compose run --rm openvpn ovpn_initpki


# 2. Generate client certificates
docker-compose run --rm openvpn easyrsa build-client-full {client_name} nopass

docker-compose run --rm openvpn ovpn_getclient {client_name} > certificate.ovpn  

```


# Open Firewall

https://www.hugeserver.com/kb/how-to-config-openvpn-ubuntu-debian/


```
ufw allow 1194/udp
```


