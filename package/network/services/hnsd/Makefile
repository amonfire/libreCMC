#
# Copyright (c) 2018 libreCMC Project <info@librecmc.org>
# Copyright (c) 2018 Robert Call <bob@bobcall.me>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=hnsd
PKG_VERSION:=0.1
PKG_RELEASE:=1
PKG_LICENSE:=MIT

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=HEAD
PKG_SOURCE_URL:=https://github.com/handshake-org/hnsd
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_FIXUP:=autoreconf
include $(INCLUDE_DIR)/package.mk

define Package/hnsd
	SECTION:=net
	CATEGORY:=Network
	TITLE:=Handshake SPV
	DEPENDS:=+libunbound +libunbound
	MAINTAINER:=Robert Call <bob@bobcall.me>
	URL:=https://handshake.org
endef

define Package/hnsd/description
SPV resolver daemon for the Handshake network.
endef

define Build/Configure
	( cd $(PKG_BUILD_DIR); ./autogen.sh )
	$(call Build/Configure/Default)
endef

define Build/Compile
	+$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)" \
		CXXFLAGS="$(TARGET_CXX)" \
		CFLAGS="$(TARGET_CFLAGS)" \
		LD="$(TARGET_CC)" \
		LDLIBS="$(LDLIBS)" \
		LDFLAGS="$(TARGET_LDFLAGS)"
		CROSS_COMPILE="$(TARGET_CROSS)" \
		EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
		ARCH="$(ARCH)"

endef

define Package/hnsd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/hnsd $(1)/usr/sbin/

endef

$(eval $(call BuildPackage,hnsd))
