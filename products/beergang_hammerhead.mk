# Inherit AOSP device configuration for hammerhead.
$(call inherit-product, device/lge/hammerhead/full_hammerhead.mk)

# Inherit common product files.
$(call inherit-product, vendor/beergang/products/common.mk)

# Setup device specific product configuration.
PRODUCT_NAME := beergang_hammerhead
PRODUCT_BRAND := google
PRODUCT_DEVICE := hammerhead
PRODUCT_MODEL := Nexus 5
PRODUCT_MANUFACTURER := LGE

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=occam BUILD_FINGERPRINT="fingerprint: google/hammerhead/hammerhead:4.4/KRT16M/893803:user/release-keys" PRIVATE_BUILD_DESC="hammerhead-user 4.4 KRT16M 893803 release-keys"

# Build SimToolKit
PRODUCT_PACKAGES += \
    Stk

# Inherit media effect blobs
-include vendor/beergang/products/common_media_effects.mk
