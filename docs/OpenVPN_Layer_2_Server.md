# OpenVPN Layer 2 Server

## Installing OpenVPN packages

TODO

## Interface Setup

TODO

## Certificate and Key Setup Instructions

TODO

## Server configuration

For server bridge option: First two parameters are the ip/netmask of
the gateway on the bridged subnet. Next two paraters indicate the
pool-start-IP and pool-end-IP, which is the part of your IP address
pool that you have reserved just for VPN clients. You have to make
sure the DHCP server on the company network is not handing those out
to on-site systems.

/etc/config/openvpn
```
config openvpn 'myvpn'
	option enabled '1'
	option dev 'tap0'
	option port '1194'
	option proto 'udp'
	option status '/var/log/openvpn_status.log'
	option log '/tmp/openvpn.log'
	option verb '3'
	option mute '5'
	option keepalive '10 120'
	option persist_key '1'
	option persist_tun '1'
	option user 'nobody'
	option group 'nogroup'
	option ca '/etc/easy-rsa/keys/ca.crt'
	option cert '/etc/easy-rsa/keys/myvpn.crt'
	option key '/etc/easy-rsa/keys/myvpn.key'
	option dh '/etc/easy-rsa/keys/dh2048.pem'
	option tls_server '1'
	option tls_auth '/etc/easy-rsa/keys/ta.key 0'
	option server_bridge '10.0.0.1 255.255.255.0 10.0.0.201 10.0.0.220'
	option topology 'subnet'
	option client_to_client '1'
	list push 'persist-key'
	list push 'persist-tun'
	list push 'redirect-gateway def1'
	# allow your clients to access to your network
	list push 'route 10.0.0.0 255.255.255.0'
	# push DNS to your clients
	list push 'dhcp-option DNS 10.0.0.1'
        # option comp_lzo 'no'
```

## Client setup information

TODO
