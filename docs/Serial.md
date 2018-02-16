# Using a serial interface with U-boot and libreCMC

A serial interface (console) provides a means of debugging or 
unlocking features hidden from the user. Most computing devices 
have a serial interface whether it is broken out by the manufacture or not.

In the case of devices that run libreCMC, a serial console is used
to configure U-boot and debug libreCMC if the network interface can't
be brought up. These instructions outline the basics of using
a serial console with a USB to serial cable.



## The basics

There are a few different standards for serial interfaces, but here we are
providing just the basics. There are 3 different connections that we care 
about : Transmit (TX), Receive (RX) and Ground (GND). Depending on the
serial cable, the color coding could be different. The common coloration
is RX is Green, TX is white and GND is black*.

These three wires will be connected to a pin header on the board or might need
to be soldered to pads. Many device manufactures are kind enough to provide a 
header and indicate where the serial interface is. Look for silkscreen labeling
with : GND, TX, RX. Sometimes additional work is needed to break out a stable
serial interface.

* Many serial cables ship with the color corresponding to the connection on the board, 
so TX and RX are effectively reversed.

Some routers use the following standard:
```
         __________________
        |            |     |
        | .   .   .  |  .  |              <- Inside of the router (you may need to do some soldering)
        |____________|_____|
                 
          |   |    \     \
          *  GND   RX    TX
```

In this case, transmit is in the marked off box.

```
         _________________
        |                 |
        | .   .   .    .  |             
      * |_________________|

          |   |    \     \
        GND   RX    TX   Vcc

```

Some might use a dot to indicate GND, etc...

TPE-R1100 example:

![alt text](images/serial.png "TPE-R1100 Serial")

Warning: NEVER connect the red wire to the device / router! You will most likely fry it because
many routers use 3.3V for Vcc instead of the 5V provided by USB.

## Getting a console

In order to communicate with the device, we need a terminal application to interact with
the serial port provided by the USB to serial cable. In this case, we are going to use GNU Screen.
Make sure that the GNU Screen package is installed and make sure that your user is part of the 
`dialout` group.

Before we can use the terminal application, we need to know the baud rate at which the serial
console will be provided at. With most devices running libreCMC and u-boot, this most likely will
be 115200

## putting it all together


1) Plug in / wire up the serial cable to the board.

2) Plug the USB part of the serial cable into an available USB port.

3) run `screen /dev/ttyUSB0 115200` or (if you are NOT part of the `dialup` group) `sudo screen /dev/ttyUSB0 115200`

4) Power on the device you are connecting to.

5) You should see ledgible ASCII text scroll by.


# Still needs final review

