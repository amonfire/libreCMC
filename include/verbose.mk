#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

ifndef LIBRECMC_VERBOSE
  LIBRECMC_VERBOSE:=
endif
ifeq ("$(origin V)", "command line")
  LIBRECMC_VERBOSE:=$(V)
endif

ifeq ($(LIBRECMC_VERBOSE),1)
  LIBRECMC_VERBOSE:=w
endif
ifeq ($(LIBRECMC_VERBOSE),99)
  LIBRECMC_VERBOSE:=s
endif

ifeq ($(NO_TRACE_MAKE),)
NO_TRACE_MAKE := $(MAKE) V=s$(LIBRECMC_VERBOSE)
export NO_TRACE_MAKE
endif

ifeq ($(IS_TTY),1)
  ifneq ($(strip $(NO_COLOR)),1)
    _Y:=\\033[33m
    _R:=\\033[31m
    _N:=\\033[m
  endif
endif

ifeq ($(findstring s,$(LIBRECMC_VERBOSE)),)
  define MESSAGE
	printf "$(_Y)%s$(_N)\n" "$(1)" >&8
  endef

  define ERROR_MESSAGE
	printf "$(_R)%s$(_N)\n" "$(1)" >&8
  endef

  ifeq ($(QUIET),1)
    ifneq ($(CURDIR),$(TOPDIR))
      _DIR:=$(patsubst $(TOPDIR)/%,%,${CURDIR})
    else
      _DIR:=
    endif
    _NULL:=$(if $(MAKECMDGOALS),$(shell \
		$(call MESSAGE, make[$(MAKELEVEL)]$(if $(_DIR), -C $(_DIR)) $(MAKECMDGOALS)); \
    ))
    SUBMAKE=$(MAKE)
  else
    SILENT:=>/dev/null $(if $(findstring w,$(LIBRECMC_VERBOSE)),,2>&1)
    export QUIET:=1
    SUBMAKE=cmd() { $(SILENT) $(MAKE) -s "$$@" < /dev/null || { echo "make $$*: build failed. Please re-run make with -j1 V=s or V=sc for a higher verbosity level to see what's going on"; false; } } 8>&1 9>&2; cmd
  endif

  .SILENT: $(MAKECMDGOALS)
else
  SUBMAKE=$(MAKE) -w
  define MESSAGE
    printf "%s\n" "$(1)"
  endef
  ERROR_MESSAGE=$(MESSAGE)
endif
