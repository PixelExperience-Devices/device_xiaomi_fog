# Copyright (C) 2023 Paranoid Android
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

DEVICE_PATH := device/xiaomi/fog

# Board Info
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(DEVICE_PATH)/configs/hidl/xiaomi_framework_compatibility_matrix.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/xiaomi_manifest.xml

ODM_MANIFEST_SKUS += c3qn
ODM_MANIFEST_C3QN_FILES := $(DEVICE_PATH)/configs/hidl/manifest_c3qn.xml

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_fog
TARGET_RECOVERY_DEVICE_MODULES := libinit_fog

# Kernel
BOARD_MKBOOTIMG_ARGS += --dtb $(DEVICE_PATH)-kernel/dtb.img
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)-kernel/dtbo.img

# OTA assert
TARGET_OTA_ASSERT_DEVICE := fog,rain,wind

# Screen density
TARGET_SCREEN_DENSITY := 320

# Inherit from the proprietary version
include vendor/xiaomi/fog/BoardConfigVendor.mk

# Inherit from sm6225-common
include device/xiaomi/sm6225-common/BoardConfigCommon.mk
