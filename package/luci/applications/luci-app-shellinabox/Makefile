#
# Copyright (C) 2017 Robert Call <bob@bobcall.me>
#
# You may redistribute this program and/or modify it under the terms of
# the GNU General Public License as published by the Free Software Foundation,
# either version 3 of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-shellinabox
PKG_VERSION:=0.1
PKG_RELEASE:=4

PKG_LICENSE:=GPL-3.0

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-shellinabox
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=Shell in a box integration
	URL:=
	MAINTAINER:=Robert Call <bob@bobcall.me>
	DEPENDS:=+shellinabox
endef

define Package/luci-app-shellinabox/description
	This package adds terminal integration into luci to make
	router maintanance easier for those new to GNU/Linux or
	don't have access to a GNU/Linux box.

endef

define Build/Compile
endef

define Package/luci-app-shellinabox/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci
	$(INSTALL_DIR) $(1)/www/static
	$(CP) ./luasrc/* $(1)/usr/lib/lua/luci
	$(CP) ./files/terminal.png $(1)/www/static/terminal.png
endef

$(eval $(call BuildPackage,luci-app-shellinabox))
