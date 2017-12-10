#############################################################
# vzlogger
#############################################################
VZLOGGER_VERSION = hpm-udp-api #cmake-liby-install-rules #master #875d718
VZLOGGER_SOURCE = vzlogger-$(VZLOGGER_VERSION).tgz
VZLOGGER_SITE = https://github.com/oe5hpm/vzlogger.git
VZLOGGER_SITE_METHOD = git
VZLOGGER_INSTALL_STAGING = NO
VZLOGGER_INSTALL_TARGET = YES
VZLOGGER_DEPENDENCIES = openssl json-c libgcrypt libmbus1 libcurl

define VZLOGGER_CONF_OPTS
-DENABLE_LOCAL=OFF -DENABLE_SML=off
endef

$(eval $(cmake-package))
