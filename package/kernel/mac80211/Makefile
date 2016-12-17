#
# Copyright (C) 2007-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=mac80211

PKG_VERSION:=2016-10-08
PKG_RELEASE:=1
PKG_SOURCE_URL:=http://mirror2.openwrt.org/sources
PKG_BACKPORT_VERSION:=
PKG_MD5SUM:=4f6350e3b75815060bfdf47ef266ad613c7bfea5b7b1dc4552dee69e1bebe4fb

PKG_SOURCE:=compat-wireless-$(PKG_VERSION)$(PKG_BACKPORT_VERSION).tar.bz2
PKG_BUILD_DIR:=$(KERNEL_BUILD_DIR)/compat-wireless-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

PKG_MAINTAINER:=Felix Fietkau <nbd@nbd.name>

PKG_DRIVERS = \
	ath ath5k ath9k ath9k-common ath9k-htc \
	lib80211 \
	mac80211-hwsim \


PKG_CONFIG_DEPENDS:= \
	CONFIG_PACKAGE_kmod-mac80211 \
	$(patsubst %,CONFIG_PACKAGE_kmod-%,$(PKG_DRIVERS)) \
	CONFIG_PACKAGE_MAC80211_DEBUGFS \
	CONFIG_PACKAGE_MAC80211_MESH \
	CONFIG_PACKAGE_MAC80211_TRACING \
	CONFIG_PACKAGE_ATH_DEBUG \
	CONFIG_PACKAGE_ATH_DFS \
	CONFIG_ATH9K_SUPPORT_PCOEM \
	CONFIG_ATH9K_TX99 \
	CONFIG_ATH_USER_REGD \

include $(INCLUDE_DIR)/package.mk

WMENU:=Wireless Drivers

define KernelPackage/mac80211/Default
  SUBMENU:=$(WMENU)
  URL:=https://wireless.wiki.kernel.org/
  MAINTAINER:=Felix Fietkau <nbd@nbd.name>
endef

define KernelPackage/cfg80211
  $(call KernelPackage/mac80211/Default)
  TITLE:=cfg80211 - wireless configuration API
  DEPENDS+= +iw
  FILES:= \
	$(PKG_BUILD_DIR)/compat/compat.ko \
	$(PKG_BUILD_DIR)/net/wireless/cfg80211.ko
endef

define KernelPackage/cfg80211/description
cfg80211 is the Linux wireless LAN (802.11) configuration API.
endef

define KernelPackage/mac80211
  $(call KernelPackage/mac80211/Default)
  TITLE:=Linux 802.11 Wireless Networking Stack
  DEPENDS+= +kmod-cfg80211 +hostapd-common
  KCONFIG:=\
	CONFIG_AVERAGE=y
  FILES:= $(PKG_BUILD_DIR)/net/mac80211/mac80211.ko
  MENU:=1
endef

define KernelPackage/mac80211/config
  if PACKAGE_kmod-mac80211

	config PACKAGE_MAC80211_DEBUGFS
		bool "Export mac80211 internals in DebugFS"
		select KERNEL_DEBUG_FS
		default y
		help
		  Select this to see extensive information about
		  the internal state of mac80211 in debugfs.

	config PACKAGE_MAC80211_TRACING
		bool "Enable tracing (mac80211 and supported drivers)"
		select KERNEL_FTRACE
		select KERNEL_ENABLE_DEFAULT_TRACERS
		default n
		help
		  Select this to enable tracing of mac80211 and
		  related wifi drivers (using trace-cmd).

	config PACKAGE_MAC80211_MESH
		bool "Enable 802.11s mesh support"
		default y

  endif
endef

define KernelPackage/mac80211/description
Generic IEEE 802.11 Networking Stack (mac80211)
endef

define KernelPackage/ath/config
  if PACKAGE_kmod-ath
	config ATH_USER_REGD
		bool "Force Atheros drivers to respect the user's regdomain settings"
		default y
		help
		  Atheros' idea of regulatory handling is that the EEPROM of the card defines
		  the regulatory limits and the user is only allowed to restrict the settings
		  even further, even if the country allows frequencies or power levels that
		  are forbidden by the EEPROM settings.

		  Select this option if you want the driver to respect the user's decision about
		  regulatory settings.

	config PACKAGE_ATH_DEBUG
		bool "Atheros wireless debugging"
		help
		  Say Y, if you want to debug atheros wireless drivers.
		  Only ath9k & ath10k make use of this.

	config PACKAGE_ATH_DFS
		bool "Enable DFS support"
		default y
		help
		  Dynamic frequency selection (DFS) is required for most of the 5 GHz band
		  channels in Europe, US, and Japan.

		  Select this option if you want to use such channels.

  endif
endef

define KernelPackage/ath
  $(call KernelPackage/mac80211/Default)
  TITLE:=Atheros common driver part
  DEPENDS+= @PCI_SUPPORT||USB_SUPPORT||TARGET_ar71xx||TARGET_ath25 +kmod-mac80211
  FILES:=$(PKG_BUILD_DIR)/drivers/net/wireless/ath/ath.ko
  MENU:=1
endef

define KernelPackage/ath/description
 This module contains some common parts needed by Atheros Wireless drivers.
endef

define KernelPackage/ath5k
  $(call KernelPackage/mac80211/Default)
  TITLE:=Atheros 5xxx wireless cards support
  URL:=https://wireless.wiki.kernel.org/en/users/drivers/ath5k
  DEPENDS+= @PCI_SUPPORT||@TARGET_ath25 +kmod-ath
  FILES:=$(PKG_BUILD_DIR)/drivers/net/wireless/ath/ath5k/ath5k.ko
  AUTOLOAD:=$(call AutoProbe,ath5k)
endef

define KernelPackage/ath5k/description
 This module adds support for wireless adapters based on
 Atheros 5xxx chipset.
endef

define KernelPackage/ath9k-common
  $(call KernelPackage/mac80211/Default)
  TITLE:=Atheros 802.11n wireless devices (common code for ath9k and ath9k_htc)
  URL:=https://wireless.wiki.kernel.org/en/users/drivers/ath9k
  HIDDEN:=1
  DEPENDS+= @PCI_SUPPORT||USB_SUPPORT||TARGET_ar71xx +kmod-ath +@DRIVER_11N_SUPPORT +@DRIVER_11W_SUPPORT +@KERNEL_RELAY
  FILES:= \
	$(PKG_BUILD_DIR)/drivers/net/wireless/ath/ath9k/ath9k_common.ko \
	$(PKG_BUILD_DIR)/drivers/net/wireless/ath/ath9k/ath9k_hw.ko
endef

define KernelPackage/ath9k
  $(call KernelPackage/mac80211/Default)
  TITLE:=Atheros 802.11n PCI wireless cards support
  URL:=https://wireless.wiki.kernel.org/en/users/drivers/ath9k
  DEPENDS+= @PCI_SUPPORT||TARGET_ar71xx +kmod-ath9k-common
  FILES:= \
	$(PKG_BUILD_DIR)/drivers/net/wireless/ath/ath9k/ath9k.ko
  AUTOLOAD:=$(call AutoProbe,ath9k)
endef

define KernelPackage/ath9k/description
This module adds support for wireless adapters based on
Atheros IEEE 802.11n AR5008 and AR9001 family of chipsets.
endef

define KernelPackage/ath9k/config

	config ATH9K_SUPPORT_PCOEM
		bool "Support chips used in PC OEM cards"
		depends on PACKAGE_kmod-ath9k

       config ATH9K_TX99
               bool "Enable TX99 support"
               depends on PACKAGE_kmod-ath9k

endef

define KernelPackage/ath9k-htc
  $(call KernelPackage/mac80211/Default)
  TITLE:=Atheros 802.11n USB device support
  URL:=https://wireless.wiki.kernel.org/en/users/drivers/ath9k
  DEPENDS+= @USB_SUPPORT +kmod-ath9k-common +kmod-usb-core +ath9k-htc-firmware
  FILES:= \
	$(PKG_BUILD_DIR)/drivers/net/wireless/ath/ath9k/ath9k_htc.ko
  AUTOLOAD:=$(call AutoProbe,ath9k_htc)
endef

define KernelPackage/ath9k-htc/description
This module adds support for wireless adapters based on
Atheros USB AR9271 and AR7010 family of chipsets.
endef

define KernelPackage/lib80211
  $(call KernelPackage/mac80211/Default)
  TITLE:=802.11 Networking stack
  DEPENDS:=+kmod-cfg80211 +kmod-crypto-hash
  FILES:= \
	$(PKG_BUILD_DIR)/net/wireless/lib80211.ko \
	$(PKG_BUILD_DIR)/net/wireless/lib80211_crypt_wep.ko \
	$(PKG_BUILD_DIR)/net/wireless/lib80211_crypt_ccmp.ko \
	$(PKG_BUILD_DIR)/net/wireless/lib80211_crypt_tkip.ko
  AUTOLOAD:=$(call AutoProbe, \
	lib80211 \
	lib80211_crypt_wep \
	lib80211_crypt_ccmp \
	lib80211_crypt_tkip \
  )
endef

define KernelPackage/lib80211/description
 Kernel modules for 802.11 Networking stack
 Includes:
 - lib80211
 - lib80211_crypt_wep
 - lib80211_crypt_tkip
 - lib80211_crytp_ccmp
endef


define KernelPackage/mac80211-hwsim
  $(call KernelPackage/mac80211/Default)
  TITLE:=mac80211 HW simulation device
  DEPENDS+= +kmod-mac80211 +@DRIVER_11N_SUPPORT
  FILES:=$(PKG_BUILD_DIR)/drivers/net/wireless/mac80211_hwsim.ko
  AUTOLOAD:=$(call AutoProbe,mac80211_hwsim)
endef


config_package=$(if $(CONFIG_PACKAGE_kmod-$(1)),m)

config-y:= \
	WLAN \
	NL80211_TESTMODE \
	CFG80211_WEXT \
	CFG80211_INTERNAL_REGDB \
	CFG80211_CERTIFICATION_ONUS \
	MAC80211_RC_MINSTREL \
	MAC80211_RC_MINSTREL_HT \
	MAC80211_RC_MINSTREL_VHT \
	MAC80211_RC_DEFAULT_MINSTREL \
	WLAN_VENDOR_ATH \

config-$(call config_package,cfg80211) += CFG80211

config-$(call config_package,mac80211) += MAC80211
config-$(CONFIG_PACKAGE_MAC80211_MESH) += MAC80211_MESH
ifdef CONFIG_PACKAGE_MAC80211_DEBUGFS
  config-y += \
	CFG80211_DEBUGFS \
	MAC80211_DEBUGFS \
	ATH9K_DEBUGFS \
	ATH9K_HTC_DEBUGFS \
	CARL9170_DEBUGFS \
	ATH5K_DEBUG
endif

ifdef CONFIG_PACKAGE_MAC80211_TRACING
  config-y += \
	ATH10K_TRACING \
	ATH6KL_TRACING \
	ATH_TRACEPOINTS \
	WIL6210_TRACING \
	ATH5K_TRACER \
	IWLWIFI_DEVICE_TRACING
endif

config-$(call config_package,lib80211) += LIB80211 LIB80211_CRYPT_WEP LIB80211_CRYPT_CCMP LIB80211_CRYPT_TKIP

config-$(call config_package,ath) += ATH_CARDS ATH_COMMON
config-$(CONFIG_PACKAGE_ATH_DEBUG) += ATH_DEBUG ATH10K_DEBUG ATH9K_STATION_STATISTICS
config-$(CONFIG_PACKAGE_ATH_DFS) += ATH9K_DFS_CERTIFIED ATH10K_DFS_CERTIFIED

config-$(call config_package,ath9k) += ATH9K
config-$(call config_package,ath9k-common) += ATH9K_COMMON
config-$(CONFIG_TARGET_ar71xx) += ATH9K_AHB
config-$(CONFIG_PCI) += ATH9K_PCI
config-$(CONFIG_ATH_USER_REGD) += ATH_USER_REGD
config-$(CONFIG_ATH9K_SUPPORT_PCOEM) += ATH9K_PCOEM
config-$(CONFIG_ATH9K_TX99) += ATH9K_TX99

config-$(call config_package,ath9k-htc) += ATH9K_HTC
config-$(call config_package,ath10k) += ATH10K ATH10K_PCI

config-$(call config_package,ath5k) += ATH5K
ifdef CONFIG_TARGET_ath25
  config-y += ATH5K_AHB
else
  config-y += ATH5K_PCI
endif

config-$(call config_package,carl9170) += CARL9170

config-$(call config_package,mac80211-hwsim) += MAC80211_HWSIM

config-$(CONFIG_LEDS_TRIGGERS) += MAC80211_LEDS

MAKE_OPTS:= -C "$(PKG_BUILD_DIR)" \
	CROSS_COMPILE="$(KERNEL_CROSS)" \
	ARCH="$(LINUX_KARCH)" \
	EXTRA_CFLAGS="-I$(PKG_BUILD_DIR)/include $(IREMAP_CFLAGS)" \
	KLIB_BUILD="$(LINUX_DIR)" \
	MODPROBE=true \
	KLIB=$(TARGET_MODULES_DIR) \
	KERNEL_SUBLEVEL=$(lastword $(subst ., ,$(KERNEL_PATCHVER))) \
	KBUILD_LDFLAGS_MODULE_PREREQ=

ifneq ($(findstring c,$(OPENWRT_VERBOSE)),)
  MAKE_OPTS += V=1
endif

define ConfigVars
$(subst $(space),,$(foreach opt,$(config-$(1)),CPTCFG_$(opt)=$(1)
))
endef

define mac80211_config
$(call ConfigVars,m)$(call ConfigVars,y)
endef
$(eval $(call shexport,mac80211_config))

define Build/Prepare
	rm -rf $(PKG_BUILD_DIR)
	mkdir -p $(PKG_BUILD_DIR)
	$(PKG_UNPACK)
	$(Build/Patch)
	rm -rf \
		$(PKG_BUILD_DIR)/include/linux/ssb \
		$(PKG_BUILD_DIR)/include/linux/bcma \
		$(PKG_BUILD_DIR)/include/net/bluetooth

	rm -f \
		$(PKG_BUILD_DIR)/include/linux/cordic.h \
		$(PKG_BUILD_DIR)/include/linux/crc8.h \
		$(PKG_BUILD_DIR)/include/linux/eeprom_93cx6.h \
		$(PKG_BUILD_DIR)/include/linux/wl12xx.h \
		$(PKG_BUILD_DIR)/include/linux/spi/libertas_spi.h \
		$(PKG_BUILD_DIR)/include/net/ieee80211.h \
		$(PKG_BUILD_DIR)/backport-include/linux/bcm47xx_nvram.h

	echo 'compat-wireless-$(PKG_VERSION)-$(PKG_RELEASE)-$(REVISION)' > $(PKG_BUILD_DIR)/compat_version
	$(CP) ./files/regdb.txt $(PKG_BUILD_DIR)/net/wireless/db.txt
endef

ifneq ($(CONFIG_PACKAGE_kmod-cfg80211)$(CONFIG_PACKAGE_kmod-lib80211),)
 define Build/Compile/kmod
	rm -rf $(PKG_BUILD_DIR)/modules
	+$(MAKE) $(PKG_JOBS) $(MAKE_OPTS) modules
 endef
endif

define Build/Configure
	cmp $(PKG_BUILD_DIR)/include/linux/ath9k_platform.h $(LINUX_DIR)/include/linux/ath9k_platform.h
	cmp $(PKG_BUILD_DIR)/include/linux/ath5k_platform.h $(LINUX_DIR)/include/linux/ath5k_platform.h
endef

define Build/Compile
	$(SH_FUNC) var2file "$(call shvar,mac80211_config)" $(PKG_BUILD_DIR)/.config
	$(MAKE) $(MAKE_OPTS) allnoconfig
	$(call Build/Compile/kmod)
endef

define Build/InstallDev
	mkdir -p \
		$(1)/usr/include/mac80211 \
		$(1)/usr/include/mac80211-backport \
		$(1)/usr/include/mac80211/ath \
		$(1)/usr/include/net/mac80211
	$(CP) $(PKG_BUILD_DIR)/net/mac80211/*.h $(PKG_BUILD_DIR)/include/* $(1)/usr/include/mac80211/
	$(CP) $(PKG_BUILD_DIR)/backport-include/* $(1)/usr/include/mac80211-backport/
	$(CP) $(PKG_BUILD_DIR)/net/mac80211/rate.h $(1)/usr/include/net/mac80211/
	$(CP) $(PKG_BUILD_DIR)/drivers/net/wireless/ath/*.h $(1)/usr/include/mac80211/ath/
	rm -f $(1)/usr/include/mac80211-backport/linux/module.h
endef

define KernelPackage/cfg80211/install
	$(INSTALL_DIR) $(1)/lib/wifi $(1)/lib/netifd/wireless
	$(INSTALL_DATA) ./files/lib/wifi/mac80211.sh $(1)/lib/wifi
	$(INSTALL_BIN) ./files/lib/netifd/wireless/mac80211.sh $(1)/lib/netifd/wireless
endef

$(eval $(call KernelPackage,ath))
$(eval $(call KernelPackage,ath5k))
$(eval $(call KernelPackage,ath9k))
$(eval $(call KernelPackage,ath9k-common))
$(eval $(call KernelPackage,cfg80211))
$(eval $(call KernelPackage,lib80211))
$(eval $(call KernelPackage,mac80211))
$(eval $(call KernelPackage,mac80211-hwsim))
