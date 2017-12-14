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
PKG_SOURCE_URL:=https://gogs.librecmc.org/libreCMC/libre_firmware.git
PKG_SOURCE_DATE:=2017-12-14
PKG_SOURCE_VERSION:=1afb874fa73dc1f4b7a4ffae49ed8dd32e2e772c
PKG_MIRROR_HASH:=

PKG_MAINTAINER:=

SCAN_DEPS = *.mk

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/firmware-default
  SECTION:=firmware
  CATEGORY:=Firmware
  URL:=https://gogs.librecmc.org/libreCMC/libre_firmware.git
  TITLE:=$(1)
endef

define Build/Compile

endef

include $(wildcard ./*.mk)
$(eval $(call HostBuild))
#$(eval $(call BuildPackage,linux-libre-firmware))
