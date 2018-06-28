# TP-WR841N[D]

TP-WR841N and TP-WR841ND is one and the same model, except TP-WR841ND has detachable antennas.

## Specs

* SoC : Atheros AR9341
* RAM: 32 MB
* Flash: 4 MB

## Versions Supported

* v5.x
* v8.x
* v9.x
* v10.x <-- may need to be tftp flashed
* v11.x <--
* v12.x <--


DO NOT BUY v13!!! V13 contains a mediatek
chipset, which requires a non-free firmware
blob.

## Flashing from Web GUI

Flashing instructions listed below were tested with TP-WR841N ver 8, with original firmware version 3.13.33.

1. Reset to factory default state (don't really know if it's required, but definitely won't do any harm).
2. Go to 192.168.0.1 and login with default credentials (admin/admin)
3. Navigate to _System Tools -> Firmware Upgrade_ and provide factory bin file. Press Upgrade to perform flash.
4. After router is flashed and restarted make sure to stop NetworkManager service (might not be required, but I couldn't access libreCMC web interface without stopping it).
5. Go to 192.168.10.1 and login with default credentials (root/root).
6. Navigate to _System-> Backup/Flash Firmware_ and in "Flash new firmware image" section provide sysupgrade bin file. Press Flash image to perform flash.
7. After successfull flash NetworkManager can be started again.

## Hard reset instructions

1. Press and hold RESET button for several seconds.
2. Release the button when SYS (gear) led starts blinking.
3. Wait for router to boot.
