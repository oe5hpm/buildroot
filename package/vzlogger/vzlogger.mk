#############################################################
# vzlogger
#############################################################
VZLOGGER_VERSION = master #875d718
VZLOGGER_SOURCE = vzlogger-$(VZLOGGER_VERSION).tgz
VZLOGGER_SITE = https://github.com/volkszaehler/vzlogger.git
VZLOGGER_SITE_METHOD = git
VZLOGGER_INSTALL_STAGING = NO
VZLOGGER_INSTALL_TARGET = YES
VZLOGGER_DEPENDENCIES = openssl json-c libgcrypt libmbus1

define VZLOGGER_CONF_OPTS
-DENABLE_LOCAL=OFF -DENABLE_SML=off
endef

$(eval $(cmake-package))
