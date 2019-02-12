#
# Copyright (c) libreCMC Project <info@librecmc.org>
# Copyright (c) Robert Call <bob@bobcall.me>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

EXCLUDE_DIRS:=target/linux/ath79/* \
	target/linux/ar71xx/* \
	target/linux/x86/* \
	target/linux/xburst/* \
	target/linux/Makefile \


find ./ $(foreach exclude,$(EXCLUDE_DIRS),! --path"$(exclude)")


clean_src:
	
