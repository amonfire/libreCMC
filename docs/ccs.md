# CCS (Complete Corresponding Source) Requirements

As a Free Software project, libreCMC works to go above and
beyond its license obligations to be a good neighbor and to
promote the ideals of Free Software. The project was founded
on the idea that everyone should have the *freedom* to control
the hardware they own, which means being able to fully control
what it does and what runs on it. To ensure that everyone continues
to have this freedom, a mechanism was added to the build system [1]
to generate a CCS disk which OEMs and others would be able to
distribute with devices for compliance and to push the idea that
sources should be provided with a device at the time of sale.

## `make ccsdisk`

A new target was created to build a CCS disk based upon the option of upstream
sources or to use a local checkout. As it stands, this includes everything except
for u-boot sources for a given target. In the near future, the libreCMC project
will start including versions of u-boot for all offically supported targets and
going forward a requirement for offical hardware support will be u-boot in libreCMC.


[1] libreCMC is a fork of OpenWrt, which both use a fork of [Buildroot](https://buildroot.org).
