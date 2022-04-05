ARCHS = armv7 armv7s arm64 arm64e

THEOS = /Users/azozzalfiras/opt/theos/

PREFIX = $(THEOS)/toolchain/Xcode.xctoolchain/usr/bin/


DEBUG = 0
FINALPACKAGE = 1
FOR_RELEASE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AFAppsInfo

$(TWEAK_NAME)_FILES = $(wildcard *.xm Download/*.m)
$(TWEAK_NAME)_FRAMEWORKS = Foundation CydiaSubstrate UIKit CoreMedia CoreGraphics AVFoundation
$(TWEAK_NAME)_CFLAGS = -fobjc-arc
$(TWEAK_NAME)_LDFLAGS = -Wl,-segalign,4000

include $(THEOS_MAKE_PATH)/tweak.mk
