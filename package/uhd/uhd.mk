################################################################################
#
# uhd
#
################################################################################

UHD_VERSION = 3.15.0.0
UHD_SITE = $(call github,EttusResearch,uhd,v$(UHD_VERSION))
UHD_LICENSE = GPL-3.0+
UHD_LICENSE_FILES = LICENSE.md output/LICENSE

UHD_SUPPORTS_IN_SOURCE_BUILD = NO
UHD_SUBDIR = host
UHD_INSTALL_STAGING = YES

UHD_DEPENDENCIES = \
	boost \
	$(if $(BR2_PACKAGE_PYTHON),host-python,host-python3) \
	host-python-mako

UHD_CONF_OPTS = \
	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python \
	-DRUNTIME_PYTHON_EXECUTABLE=/usr/bin/python \
	-DENABLE_C_API=ON \
	-DENABLE_DOXYGEN=OFF \
	-DENABLE_DPKD=OFF \
	-DENABLE_LIBUHD=ON \
	-DENABLE_MANUAL=OFF \
	-DENABLE_MAN_PAGES=OFF \
	-DENABLE_TESTS=OFF

ifeq ($(BR2_PACKAGE_ORC),y)
UHD_DEPENDENCIES += orc
endif

ifeq ($(BR2_PACKAGE_UHD_B100),y)
UHD_CONF_OPTS += -DENABLE_B100=ON
else
UHD_CONF_OPTS += -DENABLE_B100=OFF
endif

ifeq ($(BR2_PACKAGE_UHD_B200),y)
UHD_CONF_OPTS += -DENABLE_B200=ON
else
UHD_CONF_OPTS += -DENABLE_B200=OFF
endif

ifeq ($(BR2_PACKAGE_UHD_E300),y)
UHD_CONF_OPTS += -DENABLE_E300=ON
else
UHD_CONF_OPTS += -DENABLE_E300=OFF
endif

ifeq ($(BR2_PACKAGE_UHD_E320),y)
UHD_CONF_OPTS += -DENABLE_E320=ON
else
UHD_CONF_OPTS += -DENABLE_E320=OFF
endif

UHD_CONF_OPTS += -DENABLE_N300=OFF

ifeq ($(BR2_PACKAGE_UHD_EXAMPLES),y)
UHD_CONF_OPTS += -DENABLE_EXAMPLES=ON
else
UHD_CONF_OPTS += -DENABLE_EXAMPLES=OFF
endif

ifeq ($(BR2_PACKAGE_UHD_MPMD),y)
UHD_CONF_OPTS += -DENABLE_MPMD=ON
else
UHD_CONF_OPTS += -DENABLE_MPMD=OFF
endif

ifeq ($(BR2_PACKAGE_UHD_N230),y)
UHD_CONF_OPTS += -DENABLE_N230=ON
else
UHD_CONF_OPTS += -DENABLE_N230=OFF
endif

ifeq ($(BR2_PACKAGE_UHD_N300),y)
UHD_CONF_OPTS += -DENABLE_N300=ON
else
UHD_CONF_OPTS += -DENABLE_N300=OFF
endif

ifeq ($(BR2_PACKAGE_UHD_N320),y)
UHD_CONF_OPTS += -DENABLE_N320=ON
else
UHD_CONF_OPTS += -DENABLE_N320=OFF
endif

ifeq ($(BR2_PACKAGE_UHD_OCTOCLOCK),y)
UHD_CONF_OPTS += -DENABLE_OCTOCLOCK=ON
else
UHD_CONF_OPTS += -DENABLE_OCTOCLOCK=OFF
endif

ifeq ($(BR2_PACKAGE_UHD_RFNOC),y)
UHD_CONF_OPTS += -DENABLE_RFNOC=ON
else
UHD_CONF_OPTS += -DENABLE_RFNOC=OFF
endif

ifeq ($(BR2_PACKAGE_UHD_PYTHON),y)
UHD_DEPENDENCIES += host-python-numpy host-python-requests python-numpy python-requests
UHD_CONF_OPTS += -DENABLE_PYTHON_API=ON
else
UHD_CONF_OPTS += -DENABLE_PYTHON_API=OFF
endif

ifeq ($(BR2_PACKAGE_UHD_USB),y)
UHD_DEPENDENCIES += libusb
UHD_CONF_OPTS += -DENABLE_USB=ON
else
UHD_CONF_OPTS += -DENABLE_USB=OFF
endif

ifeq ($(BR2_PACKAGE_UHD_USRP1),y)
UHD_CONF_OPTS += -DENABLE_USRP1=ON
else
UHD_CONF_OPTS += -DENABLE_USRP1=OFF
endif

ifeq ($(BR2_PACKAGE_UHD_USRP2),y)
UHD_CONF_OPTS += -DENABLE_USRP2=ON
else
UHD_CONF_OPTS += -DENABLE_USRP2=OFF
endif

ifeq ($(BR2_PACKAGE_UHD_UTILS),y)
UHD_DEPENDENCIES += python-six
UHD_CONF_OPTS += -DENABLE_UTILS=ON
else
UHD_CONF_OPTS += -DENABLE_UTILS=OFF
endif

ifeq ($(BR2_PACKAGE_UHD_X300),y)
UHD_CONF_OPTS += -DENABLE_X300=ON
else
UHD_CONF_OPTS += -DENABLE_X300=OFF
endif

$(eval $(cmake-package))
