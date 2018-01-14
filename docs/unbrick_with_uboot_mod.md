Unbrick libreCMC routers from u-boot_mod
======================================================

1. Make sure the router is powered off.

2. On the host machine, disable network management (NetworkManager, wicd, etc..)

3. Set the host machine IP address to 192.168.1.2

4. Hold down the reset button.

5. Power on the router with the reset button held.

6. The red LED will light up, then flash every second.
After the 3rd flash, release the reset button (it may
take some coordination. From power on to the release of
the button is exactly 3 sec.

7. Open a web browser and go to 192.168.1.1/index.html

8. Click the "browse" button and select the firmware image for your router

`librecmc-ar71xx-generic-*-squashfs-*.bin`


# WIP
