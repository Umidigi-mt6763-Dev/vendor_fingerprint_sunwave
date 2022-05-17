#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

CONFIG_LOCAL_PATH := vendor/fingerprint/$(CUSTOM_KERNEL_FINGERPRINT)
$(warning start build fingerprint :$(CUSTOM_KERNEL_FINGERPRINT) ,$(CONFIG_LOCAL_PATH)/fingerprint_cfg.mk)

ifeq ($(MTK_K64_SUPPORT),yes)
# for 64bit
PRODUCT_COPY_FILES += $(CONFIG_LOCAL_PATH)/so/bin/sf_ta:vendor/bin/sf_ta  \
					  $(CONFIG_LOCAL_PATH)/so/lib64/vendor.sw.swfingerprint@1.0.so:vendor/lib64/vendor.sw.swfingerprint@1.0.so  \
                      $(CONFIG_LOCAL_PATH)/so/lib64/hw/fingerprint.default.so:vendor/lib64/hw/fingerprint.default.so
else
# for 32bit
PRODUCT_COPY_FILES += $(CONFIG_LOCAL_PATH)/so32/bin/sf_ta:vendor/bin/sf_ta  \
					  $(CONFIG_LOCAL_PATH)/so32/bin/hw/vendor.sw.swfingerprint@1.0-service:vendor/bin/hw/vendor.sw.swfingerprint@1.0-service  \
					  $(CONFIG_LOCAL_PATH)/so32/lib/vendor.sw.swfingerprint@1.0.so:vendor/lib/vendor.sw.swfingerprint@1.0.so  \
					  $(CONFIG_LOCAL_PATH)/so32/lib/hw/fingerprint.default.so:vendor/lib/hw/fingerprint.default.so  \
                      $(CONFIG_LOCAL_PATH)/so32/lib/hw/vendor.sw.swfingerprint@1.0-impl.so:vendor/lib/hw/vendor.sw.swfingerprint@1.0-impl.so  \
					  $(CONFIG_LOCAL_PATH)/so32/etc/init/vendor.sw.swfingerprint@1.0-service.rc:vendor/etc/init/vendor.sw.swfingerprint@1.0-service.rc

endif
   
DEVICE_MANIFEST_FILE += $(CONFIG_LOCAL_PATH)/sunwave_manifest.xml

