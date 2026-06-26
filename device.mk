#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/kyocera/szj203
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_TARGET_VNDK_VERSION := 31
PRODUCT_SHIPPING_API_LEVEL := 30

# A/B
ENABLE_VIRTUAL_AB := true
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/ \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_EXTRA_RECOVERY_KEYS += \
    $(LOCAL_PATH)/security/releasekey

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0 \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service \
    android.hardware.boot@1.0-impl.recovery \
    android.hardware.boot@1.2 \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-service \
    android.hardware.boot@1.2-impl.recovery

PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service \
    android.hardware.health@2.1-impl.recovery

PRODUCT_PACKAGES += \
    bootctrl.mt6765 \
    bootctrl.mt6765.recovery \
    libgptutils \
    libz \
    libcutils \
    fastbootd \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery

PRODUCT_PACKAGES += \
    bootctrl \
    bootctrl.recovery

PRODUCT_PACKAGES += \
    create_pl_dev \
    create_pl_dev.recovery \
    checkpoint_gc

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

PRODUCT_ENFORCE_VINTF_MANIFEST := true 

PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
