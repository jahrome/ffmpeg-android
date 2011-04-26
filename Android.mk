LOCAL_PATH := $(call my-dir)

LIB_PATH := build/ffmpeg/lib
BIN_PATH := build/ffmpeg/bin

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS:=eng debug

LOCAL_PREBUILT_LIBS := \
	$(LIB_PATH)/libavformat.so \
	$(LIB_PATH)/libavutil.so \
	$(LIB_PATH)/libswscale.so \
	$(LIB_PATH)/libavdevice.so \
	$(LIB_PATH)/libavfilter.so \
	$(LIB_PATH)/libpostproc.so \
	$(LIB_PATH)/libavcodec.so

LOCAL_PREBUILT_EXECUTABLES := \
	$(BIN_PATH)/ffmpeg \
	$(BIN_PATH)/ffprobe \
	$(BIN_PATH)/ffserver

include $(BUILD_MULTI_PREBUILT)
