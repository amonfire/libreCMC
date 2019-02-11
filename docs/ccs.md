# CCS (Complete Corresponding Source) Requirements

As a Free Software project, libreCMC works to go above and beyond its license
obligations to be a good neighbor and to promote the ideals of Free
Software. The project was founded on the idea that everyone should have the
*freedom* to control the hardware they own, which means being able to fully
control what it does and what runs on it. To ensure that everyone who uses
libreCMC continues to have this freedom, a mechanism was added to the build
system [1] to generate a CCS disk which OEMs and others would be able to
distribute with devices shipping libreCMC. This was done to ease compliance and
to push the idea that sources should be provided with a device at the time of
sale. Shipping a CCS disk ensures that second hand sales of the device can be
compliant if the disk is handed off with the device.


## `make ccsdisk`

A new target was created to build a CCS disk based upon the option of using a
external repository or to use a local checkout. As it stands, this includes
everything except for u-boot sources for a given target. In the near future, the
libreCMC project will start including versions of u-boot for all officially
supported targets and, going forward, make this a requirement for official
hardware in libreCMC.


## How to use

There are two ways to use CCS disk : enable "Build the libreCMC CCS Disk" during
image configuration or run `make ccsdisk` after all desired firmware images have
been built. Since u-boot for a given target most likely is missing, it's
important that the sources for u-boot be packaged and included on the disk. To
do this, make sure they are included in `target/ccsdisk/files` with proper
documentation. To make things a little bit easier, enabling the toolchain option
during image configuration and using the toolchain to build u-boot will make
things go much easier if it can be done.



[1] libreCMC is a fork of OpenWrt, which both use a fork of
[Buildroot](https://buildroot.org). Buildroot is a build system which helps to
make it easier to create firmware images for "embedded" devices.

