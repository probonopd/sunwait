#
# To build, pull the sunwait repository into the "package/" subdirectory in the OpenWrt SDK,
# then run "scripts/feeds install libpthread" and finally "make V=s".
# This will create ./bin/ar71xx/packages/base/sunwait_1.0_ar71xx.ipk (depending on your architecture)
#

include $(TOPDIR)/rules.mk

PKG_NAME:=sunwait
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

PKG_BUILD_DEPENDS:= +libpthread

define Package/sunwait
	SUBMENU:=Utilities
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=Calculate sunrise and sunset, as well as civil, nautical, and astronomical twilights
	URL:=https://github.com/probonopd/sunwait
#	DEPENDS:= +libpthread 
endef

define Package/sunwait/description
	Calculate sunrise and sunset, as well as civil, nautical, and astronomical twilights. 
	Has features that make it useful for home automation tasks.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Build/Configure
endef

define Package/sunwait/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/sunwait $(1)/usr/bin/sunwait
endef

$(eval $(call BuildPackage,sunwait))
