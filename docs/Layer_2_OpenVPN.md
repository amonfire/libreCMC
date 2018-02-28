# Layer 2 OpenVPN

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

## Server Setup and Configuration

### Required LibreCMC packages

* openvpn-openssl
* openvpn-easy-rsa
* luci-app-openvpn

### Interface Setup

In LuCi, select `Network` >> `Interfaces` and then `Add New Interface`.

- Set `Name of the new interface` to `l2server` or anything else you
  would like.
- Set `Protocol of the new interface` to unmanaged.
- Set `Cover the following interface` to `Custom Interface: vpn0`.
- In my current working system, the `firewall-zone` for the interface
  is set to `lan`, but I don't think that really matters in this case.

In my working configuration, I added tap0 into the LAN bridge
interface, and deleted the WAN interface. However, my vpn server is a
separate unit on my network, intended to operate in "bridge mode",
where if you server is your gateway router, a different configuration
might be necessary.

### Certificate and Key Setup Instructions

```
cd /etc/easy-rsa
source vars
clean-all
build-ca
build-dh
build-key-server l2server
openvpn --genkey --secret /etc/easy-rsa/keys/ta.key
mkdir -m 700 /etc/openvpn/keys
mv ca.crt l2server.crt l2server.key dh2018.pem /etc/openvpn/keys
```

N.B.: Using easy-rsa is a straightforward approach, but it may be
possible to produce more secure certificates using openssl directly.

### Generating the Client Key

TODO

### Server configuration

For the `server bridge` option: The first two parameters are the ip
and netmask of the gateway on the bridged subnet. The next two
parameters indicate the pool-start-IP and pool-end-IP, which is the
part of your IP address pool that you have reserved just for VPN
clients. You must to make sure that the DHCP server for your LAN is
not leasing out those IP addresses to local (non-vpn) clients.

```
uci set openvpn.l2server=openvpn
uci set openvpn.l2server.enabled='1'
uci set openvpn.l2server.dev='tap0'
uci set openvpn.l2server.port='1194'
uci set openvpn.l2server.proto='udp'
uci set openvpn.l2server.keepalive='10 120'
uci set openvpn.l2server.persist_key='1'
uci set openvpn.l2server.persist_tun='1'
uci set openvpn.l2server.user='nobody'
uci set openvpn.l2server.group='nogroup'
uci set openvpn.l2server.ca='/etc/easy-rsa/keys/ca.crt'
uci set openvpn.l2server.cert='/etc/easy-rsa/keys/l2server.crt'
uci set openvpn.l2server.key='/etc/easy-rsa/keys/l2server.key'
uci set openvpn.l2server.dh='/etc/easy-rsa/keys/dh2048.pem'
uci set openvpn.l2server.tls_server='1'
uci set openvpn.l2server.tls_auth='/etc/easy-rsa/keys/ta.key 0'
uci set openvpn.l2server.server_bridge='192.168.1.1 255.255.255.0 192.168.1.201 192.168.1.220'
uci set openvpn.l2server.client_to_client='1'
uci set openvpn.l2server.push='persist-key' 'persist-tun' 'redirect-gateway def1'
uci set 'route 192.168.1.0 255.255.255.0' 'dhcp-option DNS 192.168.1.1'
uci set openvpn.l2server.mute='15'
uci set openvpn.l2server.verb='3'
uci commit
```

## Client Setup and Configuration

This assumes the above configuration for the server.

### Required LibreCMC packages

* openvpn-openssl
* luci-app-openvpn

### Interface setup

TODO

### Certificate and key storage

TODO

### Client configuration

```
uci set openvpn.l2client=openvpn
uci set openvpn.l2client.float='1'
uci set openvpn.l2client.client='1'
uci set openvpn.l2client.dev='tap'
uci set openvpn.l2client.reneg_sec='0'
uci set openvpn.l2client.persist_key='1'
uci set openvpn.l2client.nobind='1'
uci set openvpn.l2client.remote_cert_tls='server'
uci set openvpn.l2client.remote='remote.alaskasi.com'
uci set openvpn.l2client.proto='udp'
uci set openvpn.l2client.rport='1194'
uci set openvpn.l2client.resolv_retry='infinite'
uci set openvpn.l2client.mute_replay_warnings='1'
uci set openvpn.l2client.key_direction='1'
uci set openvpn.l2client.redirect_gateway='def1'
uci set openvpn.l2client.enabled='1'
uci set openvpn.l2client.ca='/etc/openvpn/ca.crt'
uci set openvpn.l2client.cert='/etc/openvpn/l2client.crt'
uci set openvpn.l2client.key='/etc/openvpn/l2client.key'
uci set openvpn.l2client.tls_auth='/etc/openvpn/ta.key 1'
uci set openvpn.l2client.mute='15'
uci set openvpn.l2client.verb='3'
uci commit
```
