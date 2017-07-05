# Copyright (C) 2016 LEDE project
# Copyright (C) 2017 libreCMC Project

include $(TOPDIR)/rules.mk

PKG_NAME:=librecmc-keyring
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=https://gogs.librecmc.org/libreCMC/keyring.git
PKG_SOURCE_DATE:=2017-07-05
PKG_SOURCE_VERSION:=f701477b2bf1f733fe3a450de302dd2c21fab3d0
PKG_MIRROR_HASH:=a4ed0d3e5850a285f2a35849e3f076bacd38b8ce9019bd8592810a534b020e4e

PKG_MAINTAINER:=Robert Call <bob@librecmc.org>
PKG_LICENSE:=GPL-2.0

include $(INCLUDE_DIR)/package.mk

define Package/librecmc-keyring
  SECTION:=base
  CATEGORY:=Base system
  TITLE:=libreCMC Developer Keyring
  URL:=https://librecmc.org
endef

define Package/librecmc-keyring/description
  The libreCMC developer keyring containing developer usign and gpg public keys.
endef

Build/Compile=

define Package/librecmc-keyring/install
	$(INSTALL_DIR) $(1)/etc/opkg/keys/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/usign/* $(1)/etc/opkg/keys/
endef

$(eval $(call BuildPackage,librecmc-keyring))
