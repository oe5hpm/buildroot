#############################################################
# svxlink
#############################################################
SVXLINK_VERSION = sip
SVXLINK_SOURCE = svxlink-$(SVXLINK_VERSION).tgz
SVXLINK_SITE = http://gitlab.oe5xbl.ampr.org/oe5hpm/svxlink.git
SVXLINK_SITE_METHOD = git
SVXLINK_INSTALL_STAGING = NO
SVXLINK_INSTALL_TARGET = YES
SVXLINK_DEPENDENCIES = alsa-lib libsigc libgsm popt tcl libgcrypt libcurl libpjsip
SVXLINK_SUBDIR = src

define SVXLINK_CONF_OPTS
-DUSE_QT=OFF
endef

$(eval $(cmake-package))
