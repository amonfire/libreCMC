#
# Copyright (C) 2006-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=mkimage
PKG_VERSION:=2014.10-librecmc

PKG_SOURCE:=u-boot-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=\
	https://librecmc.org/librecmc/downloads/sources/v1.4/

PKG_HASH:=e74e658ef6b09ad1b682f5d1651f9ab1755bb3523c5261c6176d212341f7962d
PKG_CAT:=bzcat

HOST_BUILD_DIR:=$(BUILD_DIR_HOST)/u-boot-$(PKG_VERSION)

include $(INCLUDE_DIR)/host-build.mk

define Host/Prepare
	$(Host/Prepare/Default)
	rm -f \
		$(HOST_BUILD_DIR)/include/errno.h \
		$(HOST_BUILD_DIR)/include/malloc.h \
		$(HOST_BUILD_DIR)/tools/.depend
	touch $(HOST_BUILD_DIR)/include/config.mk
	touch $(HOST_BUILD_DIR)/include/config.h
endef

define Host/Compile
	$(MAKE) -C $(HOST_BUILD_DIR) defconfig   HOSTCFLAGS="$(HOST_CPPFLAGS) $(HOST_CFLAGS)" HOSTLDFLAGS="$(HOST_LDFLAGS)" HOST_LOADLIBES="$$$$(pkg-config --static --libs libcrypto)"
	$(MAKE) -C $(HOST_BUILD_DIR) tools-only  HOSTCFLAGS="$(HOST_CPPFLAGS) $(HOST_CFLAGS)" HOSTLDFLAGS="$(HOST_LDFLAGS)" HOST_LOADLIBES="$$$$(pkg-config --static --libs libcrypto)"
endef

define Host/Install
	$(CP) $(HOST_BUILD_DIR)/tools/mkimage $(STAGING_DIR_HOST)/bin/
endef

define Host/Clean
	rm -f $(STAGING_DIR_HOST)/bin/mkimage
endef

$(eval $(call HostBuild))
