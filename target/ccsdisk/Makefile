#
# Copyright (C) 2019 Robert Call <bob@bobcall.me>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk
include $(INCLUDE_DIR)/version.mk

override MAKEFLAGS=

CCS_NAME:=$(VERSION_DIST_SANITIZED)-$(VERSION_NUMBER)-src
CCS_BUILD_DIR:=$(BUILD_DIR)/$(CCS_NAME)
ISO_BUILD_DIR:=$(CCS_BUILD_DIR)/iso

all: install

$(BIN_DIR)/$(CCS_NAME).tar.gz:
	mkdir -p $(BIN_DIR)
	mkdir -p $(CCS_BUILD_DIR)
	$(if $(CONFIG_CCS_GIT_TOPDIR),(cd $(CCS_BUILD_DIR); git clone $(TOPDIR) librecmc),(cd $(CCS_BUILD_DIR); git clone $(CONFIG_CCS_GIT_UPSTREAM) librecmc))
	$(CP) $(TOPDIR)/.config $(CCS_BUILD_DIR)/librecmc
	$(CP) -r $(TOPDIR)/dl $(CCS_BUILD_DIR)/librecmc/

createiso:
	mkdir -p $(ISO_BUILD_DIR)/bin/$(BOARD)
	(cd $(CCS_BUILD_DIR); $(TAR) -czf $(ISO_BUILD_DIR)/$(CCS_NAME).tar.gz librecmc)
	$(CP) ./files/README $(ISO_BUILD_DIR)
	$(CP) $(BIN_DIR) $(ISO_BUILD_DIR)/bin/$(BOARD)
	$(VERSION_SED_SCRIPT) $(ISO_BUILD_DIR)/README
	genisoimage -J -joliet-long -r -o $(BIN_DIR)/$(CCS_NAME).iso $(ISO_BUILD_DIR)

download:
compile:
install: clean $(BIN_DIR)/$(CCS_NAME).tar.gz createiso


clean:
	rm -rf $(CCS_BUILD_DIR) $(BIN_DIR)/$(CCS_NAME).tar.gz $(BIN_DIR)/$(CCS_NAME)-src.iso
