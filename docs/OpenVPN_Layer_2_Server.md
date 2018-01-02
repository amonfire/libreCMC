# OpenVPN Layer 2 Server

## Introduction

Librecmc can operate as an OpenVPN server. OpenVPN technology connects
two networks via an encrypted tunnel. With proper server, network, and
client configuration, OpenVPN allows a client outside of your LAN to
see the LAN as though it were physically connected to the LAN.

OpenVPN can run in layer 2 or layer 3 mode. In layer 3 mode, the
remote client sees your LAN as though it is on the other side of an IP
router. In layer 2 mode, the remote client sees your LAN as though
they are both on the same Data Link segment (e.g., the same Ethernet
link). Layer 3 mode is easier to set up, but layer 2 mode is sometimes
desired to give clients a more direct exposure to services on the LAN.

## Warnings

This information is provided for educational purposes only and is not
meant to be a guide to best network security practices. Readers are
advised to study all relevant OpenVPN and network security
documentation.

## Required LibreCMC packages

* openvpn-openssl
* openvpn-easy-rsa
* luci-app-openvpn

## Interface Setup

TODO

## Certificate and Key Setup Instructions

```
cd /etc/easy-rsa
source vars
clean-all
build-ca
build-dh
build-key-server myvpn
openvpn --genkey --secret /etc/easy-rsa/keys/ta.key
```

N.B.: Using easy-rsa is a straightforward approach, but it may be
possible to produce more secure certificates using openssl directly.

## Server configuration

For the `server bridge` option: The first two parameters are the ip
and netmask of the gateway on the bridged subnet. The next two
parameters indicate the pool-start-IP and pool-end-IP, which is the
part of your IP address pool that you have reserved just for VPN
clients. You must to make sure that the DHCP server for your LAN is
not leasing out those IP addresses to local (non-vpn) clients.

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