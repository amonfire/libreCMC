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
PKG_SOURCE_DATE:=2018-02-12
PKG_SOURCE_VERSION:=413eefe5a96584139ffc0b95b3e220d85abe36b2
PKG_MIRROR_HASH:=ea781ab5a73f946c0f8c9d2417a18228983000ae390133830399d1f545ad1c6c

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
