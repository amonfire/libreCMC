# Port Forwarding

## What is port forwarding?

Technically, port forwarding is the use of Network Address Translation
(NAT) to map an IP address and port number to another IP address and
port number. Typically you need this function to be able to expose a
service running our your local network (LAN) to the Internet (WAN)
which otherwise would be impossible because your LAN uses private,
non-routable IP addresses; for example, if you are trying to run a
gaming server or a Web page server from your home network.

## LuCi Interface

* Log into the LuCi Web interface, which by default is at address https://192.168.10.1

* Select the `Network` >> `Firewall` menu.

* Select the `Port Forwards` tab.

* Under the `New Port forward` section, enter in the Name field a
  brief description of the port forward, e.g., "HTTP server" for an
  unencrypted Web page server.

* Select a protocol from the Protocol field. Most services you can run
  will be using the TCP protocol, but you can select `TCP+UDP` if you
  aren't sure.

* Usually, you will leave the `External zone` set to `wan`.

* Enter a port number in the `External port` field. Typically this
  will be the usual port number expected for a particular
  service. E.g., HTTP servers use port 80 and HTTPS servers use port
  443. You are free to use nonstandard ports, but your remote clients
  may need to use special techniques to connect to the correct port.

* Usually, you will leave the `Internal zone` set to `lan`.

* Select an IP address in the `Internet IP address` drop down menu. If
  your server is using DHCP, you should see its hostname appear in the
  list. Note that if your server is using DHCP, you should be sure
  LibreCMC has a Static Lease created for it (TODO: link to Static
  Leases documentation). If your server is has it's private IP address
  set statically, select the `Custom` option at the bottom of the
  list, and enter in IP address in the text field that appears.

* Enter a port number in the `Internal port` field. Typically this
  will be the usually port number expected for a particular service,
  unless you have set your server to work through a non-standard port.

## Port Numbers

The official IANA port number list is available at

[https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xhtml]

## Port Range

(TODO: option for configuring a range of ports simultaneously)
