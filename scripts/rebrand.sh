#!/bin/sh

# libreCMC Rebranding Script
# Copyright (c) 2016 - 2019 Robert Call <bob@bobcall.me>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Clean target directory
find target/linux \( ! -path "target/linux/ath79/*" ! -path "target/linux/ar71xx/*"  ! -path "target/linux/generic/*" ! -path "target/linux/sunxi/*" ! -path "target/linux/uml/*" ! -path "target/linux/x86/*" ! -path "target/linux/xburst/*" ! -path "target/linux/Makefile" \) -delete > /dev/null

# Clean Firmware Package Directory
find package/firmware \( ! -path "package/firmware/wireless-regdb/*" \) -delete > /dev/null

# Clean Bootloader Package Directory

find package/boot \( ! -path "package/boot/arm-trusted-firmware-sunxi/*" ! -path "package/boot/grub2/*" ! -path "package/boot/kexec-tools/*" ! -path "package/boot/uboot-envtools/*" ! -path "package/boot/uboot-sunxi/*" ! -path "package/boot/uboot-xburst/*" \) -delete > /dev/null

# Clean Kernel Package Directory
find package/kernel \( ! -path "package/kernel/button-hotplug/*" ! -path "package/kernel/gpio-button-hotplug/*" ! -path "package/kernel/i2c-gpio-custom/*" ! -path "package/kernel/kmod-sched-cake/*" ! -path "package/kernel/mac80211/*" ! -path "package/kernel/om-watchdog/*" ! -path "package/kernel/rotary-gpio-custom/*" ! -path "package/kernel/spi-gpio-custom/*" ! -path "package/kernel/trelay/*" ! -path "package/kernel/w1-gpio-custom/*" ! -path "package/kernel/linux/*"  \) -delete > /dev/null

find package/kernel/mac80211 \( ! -path "package/kernel/mac80211/Makefile" ! -path "package/kernel/mac80211/files/*" ! -path "package/kernel/mac80211/ath.mk" ! -path "package/kernel/mac80211/patches/*" ! -path "package/kernel/mac80211/scripts/*" \) -delete > /dev/null

# Clean Utils Package Directory

find package/utils \( ! -path "package/utils/adb/*" ! -path "package/utils/bsdiff/*" ! -path "package/utils/busybox/*" ! -path "package/utils/bzip2/*" ! -path "package/utils/e2fsprogs/*" ! -path "package/utils/f2fs-tools/*" ! -path "package/utils/fbtest/*" ! -path "package/utils/fuse/*" ! -path "package/utils/jsonfilter/*" ! -path "package/utils/lua/*" ! -path "package/utils/mdadm/*" ! -path "package/utils/mtd-utils/*" ! -path "package/utils/nvram/*" ! -path "package/utils/px5g/*" ! -path "package/utils/spidev_test/*" ! -path "package/utils/usbmode/*" ! -path "package/utils/usbreset/*" ! -path "package/utils/usbutils/*" ! -path "package/utils/util-linux/*" ! -path "package/utils/xfsprogs/*" \) -delete > /dev/null

# Clean Network Package Directory

rm -fr package/network/config/*dsl*

# Clean System Package Directory

rm -fr package/system/iucode-tool

cat <<EOF > package/base-files/files/etc/banner

                    ____  _____  ____
  _ _ _            |  __||     ||  __|
 | (_) |__ _ _ ___ | |   | | | || |
 | | | '_ \ '_/ -_)| |__ | | | || |__
 |_|_|_.__/_| \___||____||_|_|_||____|
 -----------------------------------------
 %C Version: %V

EOF

find ./ -type f -exec sed -i '/Copyright/!s/OPENWRT/LIBRECMC/g' {} \;
find ./ -type f -exec sed -i '/Copyright/!s/OpenWrt/libreCMC/g' {} \;
find ./ -type f -exec sed -i '/Copyright/ !{ /openwrt.org/ !{ /openwrt_version/ !{ /openwrt_release/ !{ /Kconfig.openwrt/ !{ /openwrt-keyring/ !{ s/openwrt/librecmc/g}}}}}}' {} \;

find package/base-files -type f -exec sed -i 's/192.168.1/192.168.10/g' {} \;
