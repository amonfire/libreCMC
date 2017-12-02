# TL-WR842ND

## Specs

* SoC : AR7241 (v1) AR9341 (v2)
* RAM: 32 MB
* Flash: 8 MB

## Versions Supported

* v1
* v2

## Flashing TL-WR842ND using tftp recovery mode

* Press and hold WPS/Reset button, and power on router
* Wait until Lock LED lights up before releasing WPS/Reset button
* Router has IP address: 192.168.0.86
* Router is standing by for a tftp server to appear with `wr842nv2_tp_recovery.bin` file using IP address: 192.168.0.66

### Example commands using [Parabola GNU/Linux](https://www.parabola.nu/)

Configure PC IP address to `192.168.0.66`

    ip addr add 192.168.0.66/24 dev enp3s0
    
Copy downloaded image into tftp server directory also renaming it to `wr842nv2_tp_recovery.bin`

    cp librecmc-ar71xx-generic-tl-wr842n-v2-squashfs-factory.bin /srv/tftp/wr842nv2_tp_recovery.bin

Start tftpd

`systemctl start tftpd.socket`

`systemctl start tftpd.service`

* After a short time all LEDs will flash once then router will reboot normally

## Reset instructions

???