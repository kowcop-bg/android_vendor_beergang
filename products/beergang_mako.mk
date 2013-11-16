# Inherit AOSP device configuration for mako.
$(call inherit-product, device/lge/mako/full_mako.mk)

# Inherit common product files.
$(call inherit-product, vendor/beergang/products/common.mk)

# Setup device specific product configuration.
PRODUCT_NAME := beergang_mako
PRODUCT_BRAND := google
PRODUCT_DEVICE := mako
PRODUCT_MODEL := Nexus 4
PRODUCT_MANUFACTURER := LGE

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=occam BUILD_FINGERPRINT="google/occam/mako:4.4/KRT16O/893803:user/release-keys" PRIVATE_BUILD_DESC="occam-user 4.4 KRT16O 893803 release-keys"

PRODUCT_COPY_FILES += \
    vendor/beergang/prebuilt/common/bootanimation/1080.zip:system/media/bootanimation.zip

# Build SimToolKit
PRODUCT_PACKAGES += \
    Stk

# Inherit media effect blobs
-include vendor/beergang/products/common_media_effects.mk
