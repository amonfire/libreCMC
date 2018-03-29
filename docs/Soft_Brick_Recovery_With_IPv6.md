# Soft Brick Recovery With IPv6

## Use Case

If you recklessly experiment with your libreCMC networking settings, it is likely you will eventually cause a "soft brick". Typically, this means you have messed up your IPv4 network configuration in such as way that you cannot connect to the LuCi control panel, nor connect to the busybox shell via SSH. One option is to figure out how to reload the firmware and start over from scratch. Something that might be easier, though, is to instead use IPv6 to connect to the router. This is usually possible for two reasons: (1) libreCMC has IPv6 enabled by default; (2) IPv6 has link-level autoconfiguration.

## Determine the router's link local IPv6 Address and interface name.

Connect a Gnu/Linux computer to the LAN port of the libreCMC router. Then run the `ip neigh` command. You are looking for a `REACHABLE lladdr` address that starts with `fe80`. For example:

```
christopher@evenstar:~$ ip neigh
fe80::280:aeff:fece:5a21 dev eth0 lladdr 00:80:ae:ce:5a:21 router REACHABLE
```

Here, `fe80::280:aeff:fece:5a21` is the IPv6 address, and `eth0` is the name of the interface.

## Log in to the router

Unforunately, a link local IPv6 address usually cannot be used to directly connect to the LuCi control panel. This is because Web browsers are usually programmed not to process such addresses. However, you can use SSH to connect to the busybox shell, with a command like so:

```
ssh root@fe80::280:aeff:fece:5a21%eth0
```

Replace `fe80::280:aeff:fece:5a21` with the IPv6 address of your router, and `eth0` with the correct interface name.

## What next?

Once you are logged into the busybox shell, you can use the `ip addr` command to see what is the actual state of your IPv4 network configuration. If you understand IPv4, it may be sufficient to use `ip addr add` to add an IPv4 address, which you can then use to connect to the LuCi control panel. If the IPv4 configuration is okay, you may be having a problem with the dnsmasq dhcp server, or the LuCi Web service itself may be down, for some reason. Use the `logread` command to look for errors or warnings.

If you are still not sure what to do, you can ask for help on the libreCMC IRC channel or libreCMC email list.
