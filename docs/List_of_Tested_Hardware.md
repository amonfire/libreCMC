# List of Tested Devices

| Device Name  | Contributor |  Bootloader Flashed? |
|-------------------------------------|:-------------:|------:|
| Netgear WNDR3700 v1        |  orly_owl |  ??? |
| TP-Link TL-WA901ND v3       |  jonasbits  |  ??? |
| TP-Link TL-WR710N v2.0    |  jonasbits  |  ??? |
| TP-Link TL-WR741ND v1.8  |  yang  |  ???|
| TP-Link TL-WR841ND v5.2  |  orly_owl |  ??? |
| TP-Link TL-WR841ND v8.2  | RISCi_ATOM, yang| Yes, u-boot_mod|
| TP-Link TL-WR842ND v2.0  |  zeus |  No |
| TP-Link TL-WR1043ND v1.8| orly_owl | ??? |
| TP-Link TL-WR1043ND v2.1| RISCi_ATOM | ??? |
| D-Link DGL-5500 vA1 rm' wifi card| RISCi_ATOM | ??? |
| Western Digital MyNet N750 | orly_owl | ??? |

Please note that not all of the devices on the above list are officially supported by the libreCMC
project. In order for a device to be officially supported, it needs to meet the following rules:

* libreCMC must be flashable from stock firmware (without the usage of non-free software).
* The bootloader must be free software and flashable with a serial cable + Ethernet cable or from within libreCMC.
* Components including( wifi, switch, video, etc..) must not require blobs to work.
