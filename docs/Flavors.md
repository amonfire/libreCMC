# Three Flavors of libreCMC : What are they for?

The libreCMC project ships different flavored images to achieve a desired result and 
for the continued support of hardware with limited resources. These different flavors
include:

## Main

Provides an easier to use out of the box experience; includes
the luci web interface, full package management support and basic IPv6 stack. 
These images only run on routers with more than 8M of flash.

## Core

A bare-bones image with package management, basic IPv6 stack and no web interface.
These images on routers with <8M of flash, but package management is limited on 4M targets.

## Legacy

While similar to Main images, these images are targeted at routers with 4M of flash;
provide the luci web-ui (no ssl support), basic IPv6 stack and no package management.

As always, libreCMC can be built from [source](https://gogs.librecmc.org/libreCMC/libreCMC/src/v1.4/docs/How_To_Build_libreCMC.md) or you can submit an [issue](https://gogs.librecmc.org/libreCMC/libreCMC/issues) to request
a missing feature.
