#
# MT7621 Profiles
#

define Device/gb-pc1
  DTS := GB-PC1
  DEVICE_TITLE := GnuBee Personal Cloud One
  DEVICE_PACKAGES := kmod-ata-core kmod-ata-ahci
  IMAGE_SIZE := $(ralink_default_fw_size_32M)
endef

TARGET_DEVICES += gb-pc1

define Device/mt7621
  DTS := MT7621
  BLOCKSIZE := 64k
  IMAGE_SIZE := $(ralink_default_fw_size_4M)
  DEVICE_TITLE := MediaTek MT7621 EVB
endef
TARGET_DEVICES += mt7621

define Device/timecloud
  DTS := Timecloud
  DEVICE_TITLE := Thunder Timecloud
endef
TARGET_DEVICES += timecloud

define Device/vr500
  DTS := VR500
  IMAGE_SIZE := 66453504
  DEVICE_TITLE := Planex VR500
endef
TARGET_DEVICES += vr500

# FIXME: is this still needed?
define Image/Prepare
#define Build/Compile
	rm -rf $(KDIR)/relocate
	$(CP) ../../generic/image/relocate $(KDIR)
	$(MAKE) -C $(KDIR)/relocate KERNEL_ADDR=$(KERNEL_LOADADDR) CROSS_COMPILE=$(TARGET_CROSS)
	$(CP) $(KDIR)/relocate/loader.bin $(KDIR)/loader.bin
endef
