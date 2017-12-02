# libreCMC : The libre Embedded GNU/Linux Distro

The libreCMC project is a set of fully [free](https://www.gnu.org/philosophy/free-sw.en.html) [embedded](/wiki/embedded) Operating Systems
that give users the freedom to control their computing. Our primary project is an embedded GNU/Linux-libre 
distro that is based upon the upstream OpenWRT/LEDE project. The main difference between OpenWRT/LEDE and libreCMC
are the fact that the project removes all [non-free](https://www.gnu.org/philosophy/categories.en.html#non-freeSoftware) packages, drivers and firmware blobs where the sources are not available under a free software license.

## Why would I use libreCMC?

Full control over your computing! In many cases, a variety of embedded devices require components where the sources
are not available to the community under a Free Software license. These non-free parts mean that the community can't
fix bugs, security flaws or even use a newer kernel because drivers don't work with newer versions of the kernel. By using these non-free parts,the user is at the mercy of the OEM or manufacture to maintain support for newer drivers that work with newer versions of the Linux™ kernel.

# Quick Start Build Guide

1) Checkout libreCMC

`git clone https://gogs.librecmc.org/libreCMC/libreCMC.git`

2) Enter the libreCMC directory (from now on referred by `$SRC_ROOT`)

`cd $SRC_ROOT`

3) Configure the build for the [supported device](/wiki/Supported-Hardware) and
the packages that you may want to have. Some targets may have a very limited amount
of flash (primary storage) and may not have the room for certain configurations of 
packages.

Also, in order to build libreCMC, make sure that you have all needed [dependencies](/wiki/How-To-Build-libreCMC#what-do-i-need-to-get-started).
After having installed all the necessary dependencies run:

`make menuconfig`

This will bring up the ncurses menuconfig interface for configuring libreCMC.

A good default configuration for many people would be to include:

* Luci -> luci, luci-ssl
* Base System -> ca-bundle, sqm-scripts[-extra]

4) Actually start the build:

`make` : To speed things up, you can add a few more threads to the build by using `make -j4`

5) Wait....

Depending on the machine you have access to and the configuration you selected, it will take sometime to build libreCMC. 

a) What if something goes wrong with the build? Run:

`make V=s` : This will allow for the build to be debugged. Sometimes a source package mirror is down or a dependency is missing. This
will allow us to figure out what is going wrong.


b) The build finished, but there is no image for my device! If you select more packages than can fit in flash, then some packages will
need to be removed from the configuration. After removing some packages, start the build again. Be careful when removing packages from
the configuration. Some packages are very important for basic functionality or are needed for other packages in the base system.

If you have a device that has <8M of flash, then try removing `Base System -> opkg*, ca-bundle`.


6) If everything went OK, there should be a new image in `$SRC_ROOT/bin/targets/$TARGET/generic/`


# Where do I go from here?

Well, it depends on many factors. libreCMC can be used for many different use cases. If you need help with libreCMC, help can be found on IRC using:

server :`FreeNode`

channel : `#libreCMC`