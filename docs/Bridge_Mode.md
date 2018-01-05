# Bridge Mode

A common feature of COTS Wi-Fi routers is to be able to set the router
to bridge mode, where the router stops acting like a router (layer 3
device) and starts acting like an ethernet switch (layer 2
device). LibreCMC does not actually have a bridge mode, but the same
effect is achievable with a few easy steps.

1. Add the LAN ethernet port to the LAN bridge interface
2. Set the DHCP server to ignore the LAN interface

## Adjust LAN bridge interface

Go to Network >> Interfaces page and press the EDIT button next to LAN
Network. Select the Physical Settings tab.

![alt text](images/librecmc-default-interfaces.png "LibreCMC default
 interfaces view")

Place a checkmark in the box for the "eth0" interface for wan and
wan6. (I suppose the interface name might vary amongst different
routers.

![alt text](images/librecmc-eth0-added-to-lan.png "Adjustments to
 LibreCMC interface physical settings")

You can also check the box for Enable STP if desired. There doesn't
seem to be any downside from this, though I suppose it would use more
CPU cycles and memory. STP is a protocol intended to prevent
communication loops from forming in a network of layer 2 switches.

## Adjust DHCP server settings

On the same page, scroll down a little to the DHCP Server section. In
the General Setup tab, check the "Ignore interface" box.
