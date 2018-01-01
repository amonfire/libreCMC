# libreCMC build HOWTO

This generic documentation is to help aid those who want to build libreCMC firmware images from source code. While this 
documentation is not an exhaustive source of information, it should help those who would like to build their own firmware images
or would like to develop firmware based upon libreCMC.

While libreCMC does allow for building for other targets, not all of them have been tested to work with libreCMC and are not officially supported if they are not mentioned on the libreCMC wiki.

libreCMC is licensed under the GPLv2 and contains code from other free software projects. Some code may be licensed under other free software licenses and will be noted. All software is to be distributed under the terms of the GPLv2 or their respective free software licenses.

## What do I need to get started?

* GNU/Linux distro (Trisquel, *buntu, Fedora or others)
* GNU GCC / GCC-C++
* build-essential (Debian-based distro) or base-devel (Parabola)
* flex
* gawk
* wget
* unzip
* ncurses-dev (ncurses5-devel, etc..)
* libghc-zlib-dev
* libssl-dev 
* patch
* perl5
* subversion
* git-core 
* 8 - 10 GB of disk space
* 4 GB of RAM (8 GB or more is recommended)

## Building libreCMC

1) Get the latest libreCMC source code:

`git clone https://gogs.librecmc.org/libreCMC/libreCMC.git`

or download a [release](/releases)

If you want to build packages found in libreCMC's package feed, update and install the make files 
by running the following from `$SRC_ROOT`:

`./scripts/feeds update && ./scripts/feeds install -a`

This will pull the makefiles for the package feed and make them available for selection 
when configuring your build of libreCMC.

2) Configure libreCMC for your device. 

 `make menuconfig` 

 When configuring libreCMC for your device, it is imperative that the right target and profile are selected. Currently, we only _officially_ support the AR71XX target and the TP-Link TL-MR3020 and Netgear WNDR3800. If you want other packages, please keep in mind that these devices don't have very much in terms of flash ROM and your selection of packages may not work properly. Generally, a good default configuration includes:


 * luci : Collections -> luci  + luci -> protocols -> luci-proto-relayd
 * Networking : wpa-cli + wpa-supplicant + iw
 * Utilities : Editors -> Nano

3) When done configuring, run:

 `make`

 If the build fails, type:

 `make V=s`

 if there are missing dependencies in your build environment, please install them and then run `make`.

4) If the build exits without any errors, you should have a new image in:

 `$SRC_ROOT/bin/$BUILD_TARGET/librecmc-$BUILD_TARGET-generic-$TARGET_PROFILE-$VERSION-$FS_TYPE-factory.bin`

 Where `$BUILD_TARGET = target (ex. ar71xx)`, `$TARGET_PROFILE = device`, `$VERSION = device version (some don't any)`

5) Flash the newly built image (if you are confident). libreCMC project is not responsible for bricked devices.
