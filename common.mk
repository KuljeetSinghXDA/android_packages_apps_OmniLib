#
# Include this make file to build your application against this module.
#
# Make sure to include it after you've set all your desired LOCAL variables.
# Note that you must explicitly set your LOCAL_RESOURCE_DIR before including
# this file.
#
# For example:
#
#   LOCAL_RESOURCE_DIR := \
#        $(LOCAL_PATH)/res
#
#   include packages/apps/OmniLib/common.mk
#

ifeq ($(LOCAL_USE_AAPT2),true)
LOCAL_STATIC_ANDROID_LIBRARIES += \
    android-support-annotations \
    android-support-v4 \
    OmniLib
else
LOCAL_RESOURCE_DIR += $(call my-dir)/res


## Include transitive dependencies below

# Include android-support-v7-preference, if not already included
ifeq (,$(findstring android-support-v7-preference,$(LOCAL_STATIC_JAVA_LIBRARIES)))
LOCAL_RESOURCE_DIR += frameworks/support/v7/preference/res
LOCAL_AAPT_FLAGS += --extra-packages android.support.v7.preference
LOCAL_STATIC_JAVA_LIBRARIES += android-support-v7-preference
endif

# Include android-support-v14-preference, if not already included
ifeq (,$(findstring android-support-v14-preference,$(LOCAL_STATIC_JAVA_LIBRARIES)))
LOCAL_RESOURCE_DIR += frameworks/support/v14/preference/res
LOCAL_AAPT_FLAGS += --extra-packages android.support.v14.preference
LOCAL_STATIC_JAVA_LIBRARIES += android-support-v14-preference
endif

LOCAL_AAPT_FLAGS += --auto-add-overlay --extra-packages com.android.omnilib

LOCAL_STATIC_JAVA_LIBRARIES += \
    android-support-annotations \
    android-support-v4 \
    OmniLib
endif
