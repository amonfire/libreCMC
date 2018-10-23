# Use the default kernel version if the Makefile doesn't override it

LINUX_RELEASE?=1

LINUX_VERSION-4.4 = .159
LINUX_VERSION-4.19 =

LINUX_KERNEL_HASH-4.4.159 = d464fea1f888ada3a55c3aea1c05ba9fd2d4edd7ffb152369faace18a285998b
LINUX_KERNEL_HASH-4.19 = d06d7a0d59a96ab04e7af63244627d1d5aa2d99db84f81f559f0f8e7e58f94c8

ifdef KERNEL_PATCHVER
  LINUX_VERSION:=$(KERNEL_PATCHVER)$(strip $(LINUX_VERSION-$(KERNEL_PATCHVER)))
endif

split_version=$(subst ., ,$(1))
merge_version=$(subst $(space),.,$(1))
KERNEL_BASE=$(firstword $(subst -, ,$(LINUX_VERSION)))
KERNEL=$(call merge_version,$(wordlist 1,2,$(call split_version,$(KERNEL_BASE))))
KERNEL_PATCHVER ?= $(KERNEL)

# disable the md5sum check for unknown kernel versions
LINUX_KERNEL_HASH:=$(LINUX_KERNEL_HASH-$(strip $(LINUX_VERSION)))
LINUX_KERNEL_HASH?=x
