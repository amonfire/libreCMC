# GL-INet AR300M

## Hardware Specs

* SoC : Qualcomm Atheros QCA9531
* Flash ROM : 16 MB Nor + 128 MB Nand
* RAM : 128 MB

## Flashing from factory

### Using GL-Inet's U-boot-mod and web UI

1) Set computer IP address to 192.168.1.2

2) Connect the enternet from the computer to "lan" port on the router

3) Press and hold the reset button, and power on the router by plugging in the power

4) Wait until the LED flashes once and red LED flashes 5 times before releasing the reset button.

5) Open IP address in the browser 192.168.1.1

6) Select the .img for NAND and .bin for NOR


## Tested

* v1.4.2 librecmc-ar71xx-nand-gl-ar300m-ubi-factory.img

## Reset Instructions

????

## Notes:

* This router is currently not officially supported by Librecmc

* This router is dual flash and stock uboot attempts to boot nand flash first.

* NOR flash uses .bin image and Nand flash uses .img image.

* Default router ip is 192.168.10.1

* On KDE, Disable change ipv4 method from automatic to manual to set the computer ip to 192.168.1.2.
