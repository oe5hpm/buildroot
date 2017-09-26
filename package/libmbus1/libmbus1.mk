################################################################################
#
# libmbus
#
################################################################################

LIBMBUS1_VERSION = ab89191
LIBMBUS1_SITE = https://github.com/rscada/libmbus.git
LIBMBUS1_SITE_METHOD = git
LIBMBUS1_INSTALL_STAGING = YES
LIBMBUS1_INSTALL_TARGET = YES
LIBMBUS1_LICENSE = BSD-3-Clause
LIBMBUS1_LICENSE_FILES = COPYING
LIBMBUS1_AUTORECONF = YES
LIBMBUS1_AUTORECONF_OPTS = -f

$(eval $(autotools-package))
