# libreCMC Router Reset

## Hard reset

### Manual way (if you can’t access the web interface)

1. Power off the router.

2. Power on the router.

3. As soon as the SYS light (the gear) flashes, hold down the reset button until the 
SYS LED flashes faster.

4. Stop Network-Manager or other network configuration services.

5. Plug in an ethernet cable from your machine to one of the LAN ports.

6. Set your computer’s IP address to 192.168.10.2

7.  `telnet  192.168.10.1` (192.168.1.1 on pre v1.3.1 devices).
    With v1.3.4+ devices, telnet is disabled. use ssh:
    `ssh root@192.168.10.1`

8. At the shell prompt, type:
`firstboot`

9. After you have confirmed that you want to reset everything your need to reboot the router:
`reboot`  <- It can manually be turned off too.

### Resetting via web interface

1. Login into the router via : 192.168.10.1 (or 192.168.1.1, depending on your configuration).

2. Navigate to: System -> Backup / Flash Firmware 

3. Click : "Preform Reset"

Note: After resetting the router, it will be in a default state (wireless will be disabled, no password
is set, ip-forwarding is disabled and telnet is enabled and the default IP should be 192.168.10.1) 
It is recommended that you re-load the default configuration:

# Restoring old configurations

1. Make sure you have your network-manager turned on

2. Log into the router via : 192.168.10.1 

3. Navigate to : System -> Backup / Flash Firmware

4. By "Restore Backup" , click the browse button and select the libreCMC configuration backup (*.tar.gz).



