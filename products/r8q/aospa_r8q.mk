#
# SPDX-FileCopyrightText: Paranoid Android
# SPDX-License-Identifier: Apache-2.0
#

ifeq (aospa_r8q, $(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Target flags
TARGET_BOARD_PLATFORM := kona
TARGET_SUPPORTS_OMX_SERVICE := false
TARGET_PROVIDES_POWERHAL := true
TARGET_COMMON_QTI_COMPONENTS := \
    overlay \
    perf \
    usb

ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.debuggable=1
endif

# Inherit from the custom device configuration.
$(call inherit-product, device/samsung/r8q/device.mk)

# Inherit from the AOSPA configuration.
$(call inherit-product, vendor/aospa/target/product/aospa-target.mk)

PRODUCT_NAME := aospa_r8q
PRODUCT_BRAND := samsung
PRODUCT_DEVICE := r8q
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := SM-G780G

PRODUCT_GMS_CLIENTID_BASE := android-samsung

# Boot animation resolution.
TARGET_BOOT_ANIMATION_RES := 1080

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="r8qxx-user 13 TP1A.220624.014 G780GXXSHEYJ1 release-keys" \
    BuildFingerprint=samsung/r8qxx/r8q:11/RP1A.200720.012/G780GXXSHEYJ1:user/release-keys \
    DeviceProduct=r8qxx \
    SystemName=r8qxx

endif
