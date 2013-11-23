# Generic product
PRODUCT_NAME := beergang
PRODUCT_BRAND := beergang
PRODUCT_DEVICE := generic

# Inherit kitkat audio package.
$(call inherit-product, vendor/beergang/products/kitkataudio.mk)

# Common overrides
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

# Build Launcher 3
PRODUCT_PACKAGES += \
    Launcher3 \

# Common overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/beergang/overlay/common

# World APN list
PRODUCT_COPY_FILES += \
    vendor/beergang/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# Latin IME lib
PRODUCT_COPY_FILES += \
    vendor/beergang/proprietary/common/system/lib/libjni_latinime.so:system/lib/libjni_latinime.so

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml
    
# T-Mobile theme engine
#include vendor/beergang/products/themes_common.mk

    
# Versioning System
 PRODUCT_VERSION_MAJOR = alpha
 PRODUCT_VERSION_MINOR = 0.4
 BEERGANG_POSTFIX := $(shell date +"%Y%m%d-%H%M")

 # Set all versions
 BEERGANG_VERSION := $(TARGET_PRODUCT)-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(BEERGANG_POSTFIX)
 BEERGANG_MOD_VERSION := $(TARGET_PRODUCT)-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(BEERGANG_POSTFIX)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.beergang.version=$(BEERGANG_VERSION) \
    ro.modversion=$(BEERGANG_MOD_VERSION)

# Motox dalvik patch
    ifneq ($(filter beergang_hammerhead beergang_mako,$(TARGET_PRODUCT)),)
    $(call inherit-product, vendor/beergang/products/motoxdalvikpatch.mk)
endif
