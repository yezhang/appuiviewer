THEOS_DEVICE_IP = 192.168.1.3
THEOS_DEVICE_PORT = 22

ARCHS = arm64
export TARGET = iphone:latest:14.0
INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AppUIViewer

AppUIViewer_FILES = Tweak.xm
$(TWEAK_NAME)_FRAMEWORKS = Foundation UIKit
# AppUIViewer_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

before-package::
	@echo "Run FLEX dylib build script..."
	./build_dylib.sh

# after-install::
# 	install.exec "killall -9 SpringBoard"