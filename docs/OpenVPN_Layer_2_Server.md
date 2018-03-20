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

In LuCi, select `Network` >> `Interfaces` and then `Add New Interface`.

- Set `Name of the new interface` to `myvpn` or anything else you would like.
- Set `Protocol of the new interface` to unmanaged.
- Set `Cover the following interface` to `Custom Interface: vpn0`.
- In my current working system, the `firewall-zone` for the interface
  is set to `lan`, but I don't think that really matters in this case.

In my working configuration, I added tap0 into the LAN bridge
interface, and deleted the WAN interface. However, my vpn server is a
separate unit on my network, intended to operate in "bridge mode",
where if you server is your gateway router, a different configuration
might be necessary.

## Certificate and Key Setup Instructions

```
cd /etc/easy-rsa
source vars
clean-all
build-ca
build-dh
build-key-server myvpn
openvpn --genkey --secret /etc/easy-rsa/keys/ta.key
mkdir -m 700 /etc/openvpn/keys
mv ca.crt myvpn.crt myvpn.key dh2018.pem /etc/openvpn/keys
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
	option keepalive '10 120'
	option persist_key '1'
	option persist_tun '1'
	option user 'nobody'
	option group 'nogroup'
	option ca '/etc/openvpn/keys/ca.crt'
	option cert '/etc/openvpn/keys/myvpn.crt'
	option key '/etc/openvpn/keys/myvpn.key'
	option dh '/etc/openvpn/keys/dh2048.pem'
	option tls_server '1'
	option tls_auth '/etc/openvpn/keys/ta.key 0'
	option server_bridge '10.0.0.1 255.255.255.0 10.0.0.201 10.0.0.220'
	option client_to_client '1'
	list push 'persist-key'
	list push 'persist-tun'
	list push 'redirect-gateway def1'
	list push 'route 10.0.0.0 255.255.255.0'
	list push 'dhcp-option DNS 10.0.0.1'
	option mute '15'
	option verb '3'
```

## Client setup information

TODO
