# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# inherit from msm8974-common
include device/sony/msm8974-common/BoardConfigCommon.mk

PRODUCT_VENDOR_KERNEL_HEADERS := device/sony/shinano-common/kernel-headers

TARGET_SPECIFIC_HEADER_PATH += device/sony/shinano-common/include

# Platform
BOARD_VENDOR_PLATFORM := shinano

# Kernel information
BOARD_KERNEL_BASE     := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE  := androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3b7 ehci-hcd.park=3 androidboot.bootdevice=msm_sdcc.1 vmalloc=300M dwc3.maximum_speed=high dwc3_msm.prop_chg_detect=Y display_status=on
BOARD_MKBOOTIMG_ARGS  := --ramdisk_offset 0x02000000 --tags_offset 0x01E00000
BOARD_KERNEL_SEPARATED_DT := true
TARGET_DTB_EXTRA_FLAGS := --force-v2

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Audio
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/sony/shinano-common/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/sony/shinano-common/bluetooth/vnd_shinano.txt

# Camera
TARGET_RELEASE_CPPFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
BOARD_CAMERA_HAVE_ISO := true
USE_DEVICE_SPECIFIC_CAMERA := true
BOARD_QTI_CAMERA_32BIT_ONLY := true

# CM Hardware
BOARD_HARDWARE_CLASS += device/sony/shinano-common/cmhw

# Dumpstate
BOARD_LIB_DUMPSTATE := libdumpstate.sony

# GPS
TARGET_PROVIDES_GPS_LOC_API := true

# Init
TARGET_INIT_VENDOR_LIB := libinit_shinano

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/sony/shinano-common/sepolicy

BOARD_SEPOLICY_UNION += \
    mlog_qmi.te \
    tfa_amp.te

# Wifi
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/bcmdhd.ko"
WIFI_DRIVER_MODULE_NAME          := "bcmdhd"
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP           := "/system/etc/firmware/wlan/bcmdhd/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/firmware/wlan/bcmdhd/fw_bcmdhd.bin"
WIFI_DRIVER_MODULE_ARG           := "nvram_path=/system/etc/firmware/wlan/bcmdhd/bcmdhd.cal"

# NFC
BOARD_NFC_CHIPSET := pn547
BOARD_NFC_DEVICE := /dev/pn547

# Filesystem
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true

# Partition information
BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2671771648

# Recovery
TARGET_RECOVERY_FSTAB := device/sony/shinano-common/rootdir/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"

# TWRP flags
DEVICE_RESOLUTION := 1080x1920
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_SDCARD_ON_DATA := true
TW_HAS_NO_RECOVERY_PARTITION := true
TW_FLASH_FROM_STORAGE := true
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true
# TW_INCLUDE_CRYPTO := true
TW_INCLUDE_JB_CRYPTO := true
TW_CRYPTO_FS_TYPE := "ext4"
TW_CRYPTO_REAL_BLKDEV := "/dev/block/platform/msm_sdcc.1/by-name/userdata"
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_FS_OPTIONS := "nosuid,nodev,barrier=1,noauto_da_alloc,discard"
TW_CRYPTO_FS_FLAGS := "0x00000406"
TW_CRYPTO_KEY_LOC := "footer"
TW_INCLUDE_FUSE_EXFAT := true
# TW_BOARD_CUSTOM_GRAPHICS := ../../../device/sony/shinano-common/recovery/twrpgraphics.c
TW_BRIGHTNESS_PATH := /sys/class/leds/wled:backlight/brightness
TW_MAX_BRIGHTNESS := 4095
TW_NO_USB_STORAGE := true

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/sony/shinano-common
