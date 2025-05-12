#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)
# Inherit some common Omni stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

$(call inherit-product, device/kyocera/szj203/device.mk)

PRODUCT_DEVICE := szj203
PRODUCT_NAME := twrp_szj203
PRODUCT_BRAND := justsystems
PRODUCT_MODEL := SZJ203
PRODUCT_MANUFACTURER := kyocera

PRODUCT_GMS_CLIENTID_BASE := android-kyocera


PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.build.product=SZJ-JS203 \
    ro.product.board=k65v1_64_bsp \
    ro.product.device=SZJ203 \
    persist.service.adb.enable=1 \
　　 persist.service.debuggable=1 \
    persist.sys.usb.config=mtp,adb \
    ro.usb.config=mtp,adb
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="vnd_k65v1_64_bsp-user 12 SP1A.210812.016 20231108 release-keys"

BUILD_FINGERPRINT := JUSTSYSTEMS/SZJ203/SZJ203:12/SP1A.210812.016/3.130JS.0249.a:user/release-keys
