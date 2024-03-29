define Device/ap121f
  DEVICE_TITLE := ALFA Network AP121F
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2 kmod-usb-storage -swconfig
  BOARDNAME := AP121F
  IMAGE_SIZE := 16064k
  CONSOLE := ttyATH0,115200
  MTDPARTS := spi0.0:192k(u-boot)ro,64k(u-boot-env),64k(art)ro,-(firmware)
  SUPPORTED_DEVICES := ap121f
  IMAGE/sysupgrade.bin = append-kernel | pad-to $$$$(BLOCKSIZE) | \
	append-rootfs | pad-rootfs | append-metadata | check-size $$$$(IMAGE_SIZE)
endef
TARGET_DEVICES += ap121f

define Device/ap90q
  DEVICE_TITLE := YunCore AP90Q
  BOARDNAME = AP90Q
  IMAGE_SIZE = 16000k
  CONSOLE = ttyS0,115200
  MTDPARTS = spi0.0:256k(u-boot)ro,64k(u-boot-env),16000k(firmware),64k(art)ro
endef
TARGET_DEVICES += ap90q

define Device/bsb
  DEVICE_TITLE := Smart Electronics Black Swift board
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2
  BOARDNAME = BSB
  IMAGE_SIZE = 16000k
  CONSOLE = ttyATH0,115200
  MTDPARTS = spi0.0:128k(u-boot)ro,64k(u-boot-env)ro,16128k(firmware),64k(art)ro
endef
TARGET_DEVICES += bsb

define Device/carambola2
  DEVICE_TITLE := Carambola2 board from 8Devices
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2
  BOARDNAME = CARAMBOLA2
  IMAGE_SIZE = 16000k
  CONSOLE = ttyATH0,115200
  MTDPARTS = spi0.0:256k(u-boot)ro,64k(u-boot-env)ro,16000k(firmware),64k(art)ro
endef
TARGET_DEVICES += carambola2

define Device/cf-e316n-v2
  DEVICE_TITLE := COMFAST CF-E316N v2
  BOARDNAME = CF-E316N-V2
  IMAGE_SIZE = 16192k
  CONSOLE = ttyS0,115200
  MTDPARTS = spi0.0:64k(u-boot)ro,64k(art)ro,16192k(firmware),64k(art-backup)ro
endef
TARGET_DEVICES += cf-e316n-v2

define Device/cf-e320n-v2
  $(Device/cf-e316n-v2)
  DEVICE_TITLE := COMFAST CF-E320N v2
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2
  BOARDNAME = CF-E320N-V2
endef
TARGET_DEVICES += cf-e320n-v2

define Device/cf-e380ac-v2
  $(Device/cf-e380ac-v1)
  DEVICE_TITLE := COMFAST CF-E380AC v2
  BOARDNAME = CF-E380AC-V2
  IMAGE_SIZE = 16000k
  MTDPARTS = spi0.0:256k(u-boot)ro,64k(art)ro,16000k(firmware),64k(art-backup)ro
endef
TARGET_DEVICES += cf-e380ac-v2

define Device/cf-e520n
  DEVICE_TITLE := COMFAST CF-E520N
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2
  BOARDNAME = CF-E520N
  IMAGE_SIZE = 8000k
  CONSOLE = ttyS0,115200
  MTDPARTS = spi0.0:64k(u-boot)ro,64k(art)ro,8000k(firmware),64k(art-backup)ro
endef
TARGET_DEVICES += cf-e520n

define Device/cf-e530n
  $(Device/cf-e520n)
  DEVICE_TITLE := COMFAST CF-E530N
  BOARDNAME = CF-E530N
endef
TARGET_DEVICES += cf-e530n

define Device/cpe830
  $(Device/ap90q)
  DEVICE_TITLE := YunCore CPE830
  DEVICE_PACKAGES := rssileds
  BOARDNAME = CPE830
endef
TARGET_DEVICES += cpe830

define Device/cpe870
  DEVICE_TITLE := YunCore CPE870
  DEVICE_PACKAGES := rssileds
  BOARDNAME = CPE870
  IMAGE_SIZE = 7936k
  CONSOLE = ttyS0,115200
  MTDPARTS = spi0.0:64k(u-boot)ro,64k(u-boot-env),7936k(firmware),64k(config)ro,64k(art)ro
endef
TARGET_DEVICES += cpe870

define Device/dragino2
  BOARDNAME := DRAGINO2
  CONSOLE := ttyATH0,115200
  DEVICE_PACKAGES := kmod-usb-core kmod-usb-ohci kmod-usb2 kmod-usb-ledtrig-usbport
  DEVICE_TITLE := Dragino 2 (MS14)
  IMAGE_SIZE := 16000k
  MTDPARTS := spi0.0:256k(u-boot)ro,16000k(firmware),64k(config)ro,64k(art)ro
endef
TARGET_DEVICES += dragino2

define Device/weio
  DEVICE_TITLE := WeIO
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2
  BOARDNAME = WEIO
  IMAGE_SIZE = 16000k
  CONSOLE = ttyATH0,115200
  MTDPARTS = spi0.0:256k(u-boot)ro,64k(u-boot-env)ro,16000k(firmware),64k(art)ro
endef
TARGET_DEVICES += weio

define Device/gl-ar150
  DEVICE_TITLE := GL AR150
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2
  BOARDNAME = GL-AR150
  IMAGE_SIZE = 16000k
  CONSOLE = ttyATH0,115200
  MTDPARTS = spi0.0:256k(u-boot)ro,64k(u-boot-env)ro,16000k(firmware),64k(art)ro
endef

define Device/tpe-r1100
  $(Device/gl-ar150)
  DEVICE_TITLE := TPE-R1100 Think Penguin Mini Router
  BOARDNAME = TPE-R1100
endef

TARGET_DEVICES += gl-ar150 tpe-r1100



define Device/gl-usb150
  DEVICE_TITLE := GL.iNet GL-USB150
  DEVICE_PACKAGES := -swconfig
  BOARDNAME := GL-USB150
  IMAGE_SIZE := 16000k
  CONSOLE := ttyATH0,115200
  MTDPARTS := spi0.0:256k(u-boot)ro,64k(u-boot-env)ro,16000k(firmware),64k(art)ro
  SUPPORTED_DEVICES := gl-usb150
  IMAGE/sysupgrade.bin = append-kernel | pad-to $$$$(BLOCKSIZE) | \
        append-rootfs | pad-rootfs | append-metadata | check-size $$$$(IMAGE_SIZE)
endef
TARGET_DEVICES += gl-usb150

define Device/gl-ar300
  DEVICE_TITLE := GL AR300
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2
  BOARDNAME = GL-AR300
  IMAGE_SIZE = 16000k
  CONSOLE = ttyS0,115200
  MTDPARTS = spi0.0:256k(u-boot)ro,64k(u-boot-env)ro,16000k(firmware),64k(art)ro
endef
TARGET_DEVICES += gl-ar300

define Device/gl-ar300m
  DEVICE_TITLE := GL AR300M
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2 uboot-envtools
  BOARDNAME = GL-AR300M
  IMAGE_SIZE = 16000k
  CONSOLE = ttyS0,115200
  MTDPARTS = spi0.0:256k(u-boot)ro,64k(u-boot-env),16000k(firmware),64k(art)ro
endef

define Device/tpe-r1200
  $(Device/gl-ar300m)
  DEVICE_TITLE := TPE-R1200 Think Penguin Mini Router
  BOARDNAME = TPE-R1200
endef

TARGET_DEVICES += gl-ar300m tpe-r1200


define Device/gl-ar750
  DEVICE_TITLE := GL.iNet GL-AR750
  DEVICE_PACKAGES := kmod-usb-core \
	kmod-usb2 kmod-usb-storage
  BOARDNAME := GL-AR750
  SUPPORTED_DEVICES := gl-ar750
  IMAGE_SIZE := 16000k
  MTDPARTS := spi0.0:256k(u-boot)ro,64k(u-boot-env),64k(art)ro,-(firmware)
  IMAGE/sysupgrade.bin := append-kernel | pad-to $$$$(BLOCKSIZE) | \
	append-rootfs | pad-rootfs | append-metadata | check-size $$$$(IMAGE_SIZE)
endef
TARGET_DEVICES += gl-ar750

define Device/gl-domino
  DEVICE_TITLE := GL Domino Pi
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2
  BOARDNAME = DOMINO
  IMAGE_SIZE = 16000k
  CONSOLE = ttyATH0,115200
  MTDPARTS = spi0.0:256k(u-boot)ro,64k(u-boot-env)ro,16000k(firmware),64k(art)ro
endef
TARGET_DEVICES += gl-domino

define Device/gl-mifi
  DEVICE_TITLE := GL MIFI
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2
  BOARDNAME = GL-MIFI
  IMAGE_SIZE = 16000k
  CONSOLE = ttyATH0,115200
  MTDPARTS = spi0.0:256k(u-boot)ro,64k(u-boot-env)ro,16000k(firmware),64k(art)ro
endef
TARGET_DEVICES += gl-mifi

define Device/mr12
  DEVICE_TITLE := Meraki MR12
  DEVICE_PACKAGES := kmod-spi-gpio
  BOARDNAME = MR12
  IMAGE_SIZE = 15680k
  MTDPARTS = spi0.0:256k(u-boot)ro,256k(u-boot-env)ro,13440k(rootfs),2240k(kernel),64k(mac),128k(art)ro,15680k@0x80000(firmware)
  IMAGE/kernel.bin = append-kernel
  IMAGE/rootfs.bin = append-rootfs | pad-rootfs
  IMAGE/sysupgrade.bin = append-rootfs | pad-rootfs | pad-to 13440k | append-kernel | check-size $$$$(IMAGE_SIZE)
  IMAGES := kernel.bin rootfs.bin sysupgrade.bin
endef
TARGET_DEVICES += mr12

define Device/mr16
  DEVICE_TITLE := Meraki MR16
  DEVICE_PACKAGES := kmod-spi-gpio
  BOARDNAME = MR16
  IMAGE_SIZE = 15680k
  MTDPARTS = spi0.0:256k(u-boot)ro,256k(u-boot-env)ro,13440k(rootfs),2240k(kernel),64k(mac),128k(art)ro,15680k@0x80000(firmware)
  IMAGE/kernel.bin = append-kernel
  IMAGE/rootfs.bin = append-rootfs | pad-rootfs
  IMAGE/sysupgrade.bin = append-rootfs | pad-rootfs | pad-to 13440k | append-kernel | check-size $$$$(IMAGE_SIZE)
  IMAGES := kernel.bin rootfs.bin sysupgrade.bin
endef
TARGET_DEVICES += mr16

define Device/dr531
  DEVICE_TITLE := Wallys DR531
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2
  BOARDNAME = DR531
  IMAGE_SIZE = 7808k
  MTDPARTS = spi0.0:192k(u-boot)ro,64k(u-boot-env),64k(partition-table)ro,7808k(firmware),64k(art)ro
endef
TARGET_DEVICES += dr531

define Device/wndr3700
  DEVICE_TITLE := NETGEAR WNDR3700
  DEVICE_PACKAGES := kmod-usb-core kmod-usb-ohci kmod-usb2 kmod-usb-ledtrig-usbport kmod-leds-wndr3700-usb
  BOARDNAME = WNDR3700
  NETGEAR_KERNEL_MAGIC = 0x33373030
  NETGEAR_BOARD_ID = WNDR3700
  IMAGE_SIZE = 7680k
  MTDPARTS = spi0.0:320k(u-boot)ro,128k(u-boot-env)ro,7680k(firmware),64k(art)ro
  IMAGES := sysupgrade.bin factory.img factory-NA.img
  KERNEL := kernel-bin | patch-cmdline | lzma -d20 | netgear-uImage lzma
  IMAGE/default = append-kernel | pad-to $$$$(BLOCKSIZE) | netgear-squashfs | append-rootfs | pad-rootfs
  IMAGE/sysupgrade.bin = $$(IMAGE/default) | check-size $$$$(IMAGE_SIZE)
  IMAGE/factory.img = $$(IMAGE/default) | netgear-dni | check-size $$$$(IMAGE_SIZE)
  IMAGE/factory-NA.img = $$(IMAGE/default) | netgear-dni NA | check-size $$$$(IMAGE_SIZE)
endef

define Device/wndr3700v2
$(Device/wndr3700)
  DEVICE_TITLE := NETGEAR WNDR3700 v2
  NETGEAR_BOARD_ID = WNDR3700v2
  NETGEAR_KERNEL_MAGIC = 0x33373031
  NETGEAR_HW_ID = 29763654+16+64
  IMAGE_SIZE = 15872k
  MTDPARTS = spi0.0:320k(u-boot)ro,128k(u-boot-env)ro,15872k(firmware),64k(art)ro
  IMAGES := sysupgrade.bin factory.img
endef

define Device/wndr3800
$(Device/wndr3700v2)
  DEVICE_TITLE := NETGEAR WNDR3800
  NETGEAR_BOARD_ID = WNDR3800
  NETGEAR_HW_ID = 29763654+16+128
endef

define Device/wndr3800ch
$(Device/wndr3800)
  DEVICE_TITLE := NETGEAR WNDR3800 (Ch)
  NETGEAR_BOARD_ID = WNDR3800CH
endef

define Device/wndrmac
$(Device/wndr3700v2)
  DEVICE_TITLE := NETGEAR WNDRMAC
  NETGEAR_BOARD_ID = WNDRMAC
endef

define Device/wndrmacv2
$(Device/wndr3800)
  DEVICE_TITLE := NETGEAR WNDRMAC v2
  NETGEAR_BOARD_ID = WNDRMACv2
endef

TARGET_DEVICES += wndr3700 wndr3700v2 wndr3800 wndr3800ch wndrmac wndrmacv2

define Device/cap324
  DEVICE_TITLE := PowerCloud CAP324 Cloud AP
  DEVICE_PACKAGES := uboot-envtools
  BOARDNAME := CAP324
  DEVICE_PROFILE := CAP324
  IMAGE_SIZE = 15296k
  MTDPARTS = spi0.0:256k(u-boot)ro,64k(u-boot-env)ro,15296k(firmware),640k(certs),64k(nvram),64k(art)ro
endef

TARGET_DEVICES += cap324

define Device/cap324-nocloud
  DEVICE_TITLE := PowerCloud CAP324 Cloud AP (No-Cloud)
  DEVICE_PACKAGES := uboot-envtools
  BOARDNAME := CAP324
  DEVICE_PROFILE := CAP324
  IMAGE_SIZE = 16000k
  MTDPARTS = spi0.0:256k(u-boot)ro,64k(u-boot-env)ro,16000k(firmware),64k(art)ro
endef

TARGET_DEVICES += cap324-nocloud

define Device/cr3000
  DEVICE_TITLE := PowerCloud CR3000 Cloud Router
  DEVICE_PACKAGES := uboot-envtools
  BOARDNAME := CR3000
  DEVICE_PROFILE := CR3000
  IMAGE_SIZE = 7104k
  MTDPARTS = spi0.0:256k(u-boot)ro,64k(u-boot-env)ro,7104k(firmware),640k(certs),64k(nvram),64k(art)ro
endef

TARGET_DEVICES += cr3000

define Device/cr3000-nocloud
  DEVICE_TITLE := PowerCloud CR3000 (No-Cloud)
  DEVICE_PACKAGES := uboot-envtools
  BOARDNAME := CR3000
  DEVICE_PROFILE := CR3000
  IMAGE_SIZE = 7808k
  MTDPARTS = spi0.0:256k(u-boot)ro,64k(u-boot-env)ro,7808k(firmware),64k(art)ro
endef

TARGET_DEVICES += cr3000-nocloud

define Device/cr5000
  DEVICE_TITLE := PowerCloud CR5000 Cloud Router
  DEVICE_PACKAGES := uboot-envtools kmod-usb2 kmod-usb-ohci kmod-usb-ledtrig-usbport kmod-usb-core
  BOARDNAME := CR5000
  DEVICE_PROFILE := CR5000
  IMAGE_SIZE = 7104k
  MTDPARTS = spi0.0:256k(u-boot)ro,64k(u-boot-env)ro,7104k(firmware),640k(certs),64k(nvram),64k(art)ro
endef

TARGET_DEVICES += cr5000

define Device/cr5000-nocloud
  DEVICE_TITLE := PowerCloud CR5000 (No-Cloud)
  DEVICE_PACKAGES := uboot-envtools kmod-usb2 kmod-usb-ohci kmod-usb-ledtrig-usbport kmod-usb-core
  BOARDNAME := CR5000
  DEVICE_PROFILE := CR5000
  IMAGE_SIZE = 7808k
  MTDPARTS = spi0.0:256k(u-boot)ro,64k(u-boot-env)ro,7808k(firmware),64k(art)ro
endef

TARGET_DEVICES += cr5000-nocloud

define Device/antminer-s1
  $(Device/tplink-8mlzma)
  DEVICE_TITLE := Antminer-S1
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2 kmod-crypto-manager kmod-i2c-gpio-custom kmod-usb-hid
  BOARDNAME := ANTMINER-S1
  DEVICE_PROFILE := ANTMINERS1
  TPLINK_HWID := 0x04440101
  CONSOLE := ttyATH0,115200
endef

define Device/antminer-s3
  $(Device/tplink-8mlzma)
  DEVICE_TITLE := Antminer-S3
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2 kmod-crypto-manager kmod-i2c-gpio-custom kmod-usb-hid
  BOARDNAME := ANTMINER-S3
  DEVICE_PROFILE := ANTMINERS3
  TPLINK_HWID := 0x04440301
  CONSOLE := ttyATH0,115200
endef

define Device/antrouter-r1
  $(Device/tplink-8mlzma)
  DEVICE_TITLE := Antrouter-R1
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2
  BOARDNAME := ANTROUTER-R1
  DEVICE_PROFILE := ANTROUTERR1
  TPLINK_HWID := 0x44440101
  CONSOLE := ttyATH0,115200
endef

define Device/el-m150
  $(Device/tplink-8mlzma)
  DEVICE_TITLE := EasyLink EL-M150
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2
  BOARDNAME := EL-M150
  DEVICE_PROFILE := ELM150
  TPLINK_HWID := 0x01500101
  CONSOLE := ttyATH0,115200
endef

define Device/el-mini
  $(Device/tplink-8mlzma)
  DEVICE_TITLE := EasyLink EL-MINI
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2
  BOARDNAME := EL-MINI
  DEVICE_PROFILE := ELMINI
  TPLINK_HWID := 0x01530001
  CONSOLE := ttyATH0,115200
endef
TARGET_DEVICES += antminer-s1 antminer-s3 antrouter-r1 el-m150 el-mini

define Device/gl-inet-6408A-v1
  $(Device/tplink-8mlzma)
  DEVICE_TITLE := GL.iNet 6408
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2
  BOARDNAME := GL-INET
  DEVICE_PROFILE := GLINET
  TPLINK_HWID := 0x08000001
  CONSOLE := ttyATH0,115200
endef

define Device/gl-inet-6416A-v1
  $(Device/tplink-16mlzma)
  DEVICE_TITLE := GL.iNet 6416
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2
  BOARDNAME := GL-INET
  DEVICE_PROFILE := GLINET
  TPLINK_HWID := 0x08000001
  CONSOLE := ttyATH0,115200
endef
TARGET_DEVICES += gl-inet-6408A-v1 gl-inet-6416A-v1

define Device/jwap230
  DEVICE_TITLE := jjPlus JWAP230
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2
  BOARDNAME = JWAP230
  IMAGE_SIZE = 16000k
  MTDPARTS = spi0.0:256k(u-boot)ro,64k(u-boot-env),16000k(firmware),64k(art)ro
endef
TARGET_DEVICES += jwap230

define Device/rnx-n360rt
  $(Device/tplink-4m)
  DEVICE_TITLE := Rosewill RNX-N360RT
  BOARDNAME := TL-WR941ND
  DEVICE_PROFILE := RNXN360RT
  TPLINK_HWID := 0x09410002
  TPLINK_HWREV := 0x00420001
endef
TARGET_DEVICES += rnx-n360rt

define Device/minibox-v1
  $(Device/tplink-16mlzma)
  DEVICE_TITLE := Gainstrong MiniBox V1.0
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2  kmod-usb-ledtrig-usbport
  BOARDNAME := MINIBOX-V1
  DEVICE_PROFILE := MINIBOXV1
  TPLINK_HWID := 0x3C000201
  CONSOLE := ttyATH0,115200
endef
TARGET_DEVICES += minibox-v1

define Device/omy-g1
  $(Device/tplink-16mlzma)
  DEVICE_TITLE := OMYlink OMY-G1
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2
  BOARDNAME := OMY-G1
  DEVICE_PROFILE := OMYG1
  TPLINK_HWID := 0x06660101
endef

define Device/omy-x1
  $(Device/tplink-8mlzma)
  DEVICE_TITLE := OMYlink OMY-X1
  BOARDNAME := OMY-X1
  DEVICE_PROFILE := OMYX1
  TPLINK_HWID := 0x06660201
endef
TARGET_DEVICES += omy-g1 omy-x1

define Device/onion-omega
  $(Device/tplink-16mlzma)
  DEVICE_TITLE := Onion Omega
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2 kmod-usb-storage kmod-i2c-core kmod-i2c-gpio-custom kmod-spi-bitbang kmod-spi-dev kmod-spi-gpio kmod-spi-gpio-custom kmod-usb-serial
  BOARDNAME := ONION-OMEGA
  DEVICE_PROFILE := OMEGA
  TPLINK_HWID := 0x04700001
  CONSOLE := ttyATH0,115200
endef
TARGET_DEVICES += onion-omega

define Device/smart-300
  $(Device/tplink-8mlzma)
  DEVICE_TITLE := NC-LINK SMART-300
  BOARDNAME := SMART-300
  DEVICE_PROFILE := SMART-300
  TPLINK_HWID := 0x93410001
endef
TARGET_DEVICES += smart-300

define Device/som9331
  $(Device/tplink-8mlzma)
  DEVICE_TITLE := OpenEmbed SOM9331
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2 kmod-usb-storage kmod-i2c-core kmod-i2c-gpio-custom kmod-spi-bitbang kmod-spi-dev kmod-spi-gpio kmod-spi-gpio-custom kmod-usb-serial
  BOARDNAME := SOM9331
  DEVICE_PROFILE := SOM9331
  TPLINK_HWID := 0x04800054
  CONSOLE := ttyATH0,115200
endef
TARGET_DEVICES += som9331

define Device/tellstick-znet-lite
  $(Device/tplink-16mlzma)
  DEVICE_TITLE := TellStick ZNet Lite
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2 kmod-usb-acm kmod-usb-serial kmod-usb-serial-pl2303
  BOARDNAME := TELLSTICK-ZNET-LITE
  DEVICE_PROFILE := TELLSTICKZNETLITE
  TPLINK_HWID := 0x00726001
  CONSOLE := ttyATH0,115200
endef
TARGET_DEVICES += tellstick-znet-lite

define Device/oolite
  $(Device/tplink-16mlzma)
  DEVICE_TITLE := Gainstrong OOLITE
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2 kmod-usb-ledtrig-usbport
  BOARDNAME := GS-OOLITE
  DEVICE_PROFILE := OOLITE
  TPLINK_HWID := 0x3C000101
  CONSOLE := ttyATH0,115200
endef
TARGET_DEVICES += oolite

define Device/c-55
  DEVICE_TITLE := AirTight Networks C-55
  DEVICE_PACKAGES := kmod-ath9k
  BOARDNAME = C-55
  KERNEL_SIZE = 2048k
  IMAGE_SIZE = 15872k
  MTDPARTS = spi0.0:256k(u-boot)ro,128k(u-boot-env)ro,2048k(kernel),13824k(rootfs),13824k(opt)ro,2624k(failsafe)ro,64k(art)ro,15872k@0x60000(firmware)
  IMAGE/sysupgrade.bin = append-kernel | pad-to $$$$(KERNEL_SIZE) | append-rootfs | pad-rootfs | check-size $$$$(IMAGE_SIZE)
endef

TARGET_DEVICES += c-55


define Build/uImageHiWiFi
	# Field ih_name needs to start with "tw150v1"
	mkimage -A $(LINUX_KARCH) \
		-O linux -T kernel \
		-C $(1) -a $(KERNEL_LOADADDR) -e $(if $(KERNEL_ENTRY),$(KERNEL_ENTRY),$(KERNEL_LOADADDR)) \
		-n 'tw150v1 $(call toupper,$(LINUX_KARCH)) libreCMC Linux-$(LINUX_VERSION)' -d $@ $@.new
	@mv $@.new $@
endef

define Device/hiwifi-hc6361
  DEVICE_TITLE := HiWiFi HC6361
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2 kmod-usb-storage \
	kmod-fs-ext4 kmod-nls-iso8859-1 e2fsprogs
  BOARDNAME := HiWiFi-HC6361
  DEVICE_PROFILE := HIWIFI_HC6361
  IMAGE_SIZE := 16128k
  KERNEL := kernel-bin | patch-cmdline | lzma | uImageHiWiFi lzma
  CONSOLE := ttyATH0,115200
  MTDPARTS := spi0.0:64k(u-boot)ro,64k(bdinfo)ro,16128k(firmware),64k(backup)ro,64k(art)ro
endef
TARGET_DEVICES += hiwifi-hc6361


define Build/seama
	$(STAGING_DIR_HOST)/bin/seama -i $@ $(if $(1),$(1),-m "dev=/dev/mtdblock/1" -m "type=firmware")
	mv $@.seama $@
endef

define Build/seama-seal
	$(call Build/seama,-s $@.seama $(1))
endef

define Device/seama
  CONSOLE := ttyS0,115200
  LOADER_TYPE := bin
  BLOCKSIZE := 64k
  KERNEL := kernel-bin | patch-cmdline | relocate-kernel | lzma
  KERNEL_INITRAMFS := kernel-bin | patch-cmdline | lzma | seama
  KERNEL_INITRAMFS_SUFFIX = $$(KERNEL_SUFFIX).seama
  IMAGES := sysupgrade.bin factory.bin

  # 64 bytes offset:
  # - 28 bytes seama_header
  # - 36 bytes of META data (4-bytes aligned)
  IMAGE/default := append-kernel | pad-offset $$$$(BLOCKSIZE) 64 | append-rootfs
  IMAGE/sysupgrade.bin := \
	$$(IMAGE/default) | seama | pad-rootfs | \
	check-size $$$$(IMAGE_SIZE)
  IMAGE/factory.bin := \
	$$(IMAGE/default) | seama | pad-rootfs | \
	seama-seal -m "signature=$$$$(SEAMA_SIGNATURE)" | \
	check-size $$$$(IMAGE_SIZE)
  SEAMA_SIGNATURE :=
  DEVICE_VARS += SEAMA_SIGNATURE
endef

define Device/mynet-n600
$(Device/seama)
  DEVICE_TITLE := Western Digital My Net N600
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2
  BOARDNAME = MYNET-N600
  IMAGE_SIZE = 15808k
  MTDPARTS = spi0.0:256k(u-boot)ro,64k(u-boot-env)ro,64k(devdata)ro,64k(devconf)ro,15872k(firmware),64k(radiocfg)ro
  SEAMA_SIGNATURE := wrgnd16_wd_db600
endef

define Device/mynet-n750
$(Device/seama)
  DEVICE_TITLE := Western Digital My Net N750
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2
  BOARDNAME = MYNET-N750
  IMAGE_SIZE = 15808k
  MTDPARTS = spi0.0:256k(u-boot)ro,64k(u-boot-env)ro,64k(devdata)ro,64k(devconf)ro,15872k(firmware),64k(radiocfg)ro
  SEAMA_SIGNATURE := wrgnd13_wd_av
endef

TARGET_DEVICES += dir-869-a1 mynet-n600 mynet-n750

define Build/mkwrggimg
	$(STAGING_DIR_HOST)/bin/mkwrggimg -b \
		-i $@ -o $@.imghdr -d /dev/mtdblock/1 \
		-m $(BOARDNAME) -s $(DAP_SIGNATURE) \
		-v libreCMC -B $(REVISION)
	mv $@.imghdr $@
endef

define Build/wrgg-pad-rootfs
	$(STAGING_DIR_HOST)/bin/padjffs2 $(IMAGE_ROOTFS) -c 64 >>$@
endef

TARGET_DEVICES += dap-2695-a1

define Build/mkbuffaloimg
	$(STAGING_DIR_HOST)/bin/mkbuffaloimg -B $(BOARDNAME) \
		-R $$(($(subst k, * 1024,$(ROOTFS_SIZE)))) \
		-K $$(($(subst k, * 1024,$(KERNEL_SIZE)))) \
		-i $@ -o $@.new
	mv $@.new $@
endef

define Device/bhr-4grv2
  DEVICE_TITLE := Buffalo BHR-4GRV2
  BOARDNAME := BHR-4GRV2
  ROOTFS_SIZE := 14528k
  KERNEL_SIZE := 1472k
  IMAGE_SIZE := 16000k
  MTDPARTS := spi0.0:256k(u-boot)ro,64k(u-boot-env)ro,14528k(rootfs),1472k(kernel),64k(art)ro,16000k@0x50000(firmware)
  IMAGES := sysupgrade.bin factory.bin
  IMAGE/sysupgrade.bin = append-rootfs | pad-rootfs | pad-to $$$$(ROOTFS_SIZE) | append-kernel | check-size $$$$(IMAGE_SIZE)
  IMAGE/factory.bin = append-kernel | pad-to $$$$(KERNEL_SIZE) | append-rootfs | pad-rootfs | mkbuffaloimg
endef
TARGET_DEVICES += bhr-4grv2
