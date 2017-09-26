################################################################################
#
# vncreflector
#
################################################################################

VNCREFLECTOR_VERSION = hpm
VNCREFLECTOR_SOURCE = vncreflector-$(VNCREFLECTOR_VERSION).tar.gz
VNCREFLECTOR_SITE = https://github.com/oe5hpm/vnc-reflector
VNCREFLECTOR_SITE_METHOD = git
VNCREFLECTOR_INSTALL_TARGET = YES
VNCREFLECTOR_DEPENDENCIES = zlib

define VNCREFLECTOR_BUILD_CMDS
	$(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D)
endef

define VNCREFLECTOR_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/vncreflector $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
