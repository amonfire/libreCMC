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

The scenario we are targeting here is to have:

- An OpenVPN server running on a libreCMC system which can receive
  traffic from the Internet.
- An OpenVPN client running on a libreCMC system somewhere else in the
  Internet. The client can be hidden behind a NAT.

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

- Set `Name of the new interface` to `l2server`.
- Set `Protocol of the new interface` to unmanaged.
- Set `Cover the following interface` to `Custom Interface: vpn0`.

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

### Generating a Client Key

```
build-key l2client
```

In the server-client configuration we are aiming for here, your client
key needs to be unencrypted (i.e., not password protected).

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
uci set openvpn.l2server.ca='/etc/openvpn/keys/ca.crt'
uci set openvpn.l2server.cert='/etc/openvpn/keys/l2server.crt'
uci set openvpn.l2server.key='/etc/openvpn/keys/l2server.key'
uci set openvpn.l2server.dh='/etc/openvpn/keys/dh2048.pem'
uci set openvpn.l2server.tls_server='1'
uci set openvpn.l2server.tls_auth='/etc/openvpn/keys/ta.key 0'
uci set openvpn.l2server.server_bridge='192.168.1.1 255.255.255.0 192.168.1.201 192.168.1.220'
uci set openvpn.l2server.client_to_client='1'
uci set openvpn.l2server.push='persist-key' 'persist-tun' 'redirect-gateway def1'
uci set 'route 192.168.1.0 255.255.255.0' 'dhcp-option DNS 192.168.1.1'
uci set openvpn.l2server.mute='15'
uci set openvpn.l2server.verb='3'
uci commit
```

### Firewall

I do not want to describe firewall adjustments in this document, but
the important point is that your server needs to be able to receive
UDP packages from the Internet on port 1194.

## Client Setup and Configuration

This assumes the above configuration for the server.

### Required LibreCMC packages

* openvpn-openssl
* luci-app-openvpn

### Interface setup

In LuCi, select `Network` >> `Interfaces` and then `Add New Interface`.

- Set `Name of the new interface` to `l2server`.
- Set `Protocol of the new interface` to unmanaged.
- Set `Cover the following interface` to `Custom Interface: vpn0`.

Adjust the LAN interface so that it bridges over the `vpn0` physical
interface as well as the default `eth0` and `wlan0` interfaces. This
is done from the `Network` >> `Interfaces` menu, pressing the `Edit`
button next to `LAN`, and selecting the `Physical Settings` tab.

### Certificate and key storage

```
mkdir -m 700 /etc/openvpn/keys
```

Client will the need `ca.crt`, `l2client.crt`, `l2client.key', and
`ta.key` you generated in the server section, stored in the
`/etc/openvpn/keys` directory.

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
uci set openvpn.l2client.ca='/etc/openvpn/keys/ca.crt'
uci set openvpn.l2client.cert='/etc/openvpn/keys/l2client.crt'
uci set openvpn.l2client.key='/etc/openvpn/keys/l2client.key'
uci set openvpn.l2client.tls_auth='/etc/openvpn/keys/ta.key 1'
uci set openvpn.l2client.mute='15'
uci set openvpn.l2client.verb='3'
uci commit
```

## Troubleshooting

You are likely to run into one of two issues:

- Either your client or your server is not receiving UDP packets from the other.
- You have an error in the server or client configurations.
- There is some problem with the keys or certificates, or they are
  in the wrong location.

These are some useful tools:

- Without OpenVPN even running, you can use the `nc` program (netcat)
  to send UDP packets from the client to the server, and then use the
  `tcpdump` program on the server to see if the UDP packets are
  arriving at port 1194. The syntax of these programs will not be
  covered in this document.

- The log output on the server and on the client is very helpful. Run
  `logread` to view the log or `logread && logread -f` to monitor for
  log messages. If you find an OpenVPN error, use that in conjunction
  with the OpenVPN manual page, to figure out what needs to be
  tweaked.[1]

[1] [https://openvpn.net/index.php/open-source/documentation/manuals.html]