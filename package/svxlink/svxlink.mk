#############################################################
# svxlink
#############################################################
SVXLINK_VERSION = 17.12.2
SVXLINK_SOURCE = svxlink-$(SVXLINK_VERSION).tgz
SVXLINK_SITE = https://github.com/sm0svx/svxlink.git
SVXLINK_SITE_METHOD = git
SVXLINK_INSTALL_STAGING = NO
SVXLINK_INSTALL_TARGET = YES
SVXLINK_DEPENDENCIES = alsa-lib libsigc libgsm popt tcl
SVXLINK_SUBDIR = src

define SVXLINK_CONF_OPTS
-DUSE_QT=OFF
endef

$(eval $(cmake-package))
