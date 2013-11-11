# Generic product
PRODUCT_NAME := beergang
PRODUCT_BRAND := beergang
PRODUCT_DEVICE := generic

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

# Latin IME lib
PRODUCT_COPY_FILES += \
    vendor/beergang/proprietary/common/system/lib/libjni_latinime.so:system/lib/libjni_latinime.so

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml
    
# Versioning System
 PRODUCT_VERSION_MAJOR = 1
 PRODUCT_VERSION_MINOR = beta
 PRODUCT_VERSION_MAINTENANCE = 0
 ifdef BEERGANG_BUILD_EXTRA
     BEERGANG_POSTFIX := -$(BEERGANG_BUILD_EXTRA)
 endif

 # Set all versions
 BEERGANG_VERSION := BeerGang-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-$(BEERGANG_BUILD_TYPE)$(BEERGANG_POSTFIX)
 BEERGANG_MOD_VERSION := BeerGang-$(BEERGANG_BUILD)-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-$(BEERGANG_BUILD_TYPE)$(BEERGANG_POSTFIX)
    
PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.beergang.version=$(BEERGANG_VERSION) \
    ro.modversion=$(BEERGANG_MOD_VERSION)    
