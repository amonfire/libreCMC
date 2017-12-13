#
# Copyright (C) 2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=linux-libre-firmware
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://gogs.librecmc.org/libreCMC/linux-libre-firmware.git
PKG_SOURCE_DATE:=2017-11-25
PKG_SOURCE_VERSION:=faaf53e62dfa95e22601ad867b139e8ebc2aedea
PKG_MIRROR_HASH:=

PKG_MAINTAINER:=Felix Fietkau <nbd@nbd.name>

SCAN_DEPS = *.mk

include $(INCLUDE_DIR)/package.mk

define Package/firmware-default
  SECTION:=firmware
  CATEGORY:=Firmware
  URL:=https://gogs.librecmc.org/libreCMC/linux-libre-firmware.git
  TITLE:=$(1)
endef

define Build/Compile
	+$(MAKE) -C $(PKG_BUILD_DIR) ath9k_htc_toolchain
	+$(MAKE) -C $(PKG_BUILD_DIR) ath9k_htc
endef

include $(wildcard ./*.mk)
#$(eval $(call BuildPackage,linux-libre-firmware))
