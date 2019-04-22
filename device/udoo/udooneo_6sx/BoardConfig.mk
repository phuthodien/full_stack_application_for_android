include device/udoo/imx6/soc/imx6sx.mk
include device/udoo/udooneo_6sx/build_id.mk
include device/udoo/udooneo_6sx/twrp.mk
include device/udoo/imx6/BoardConfigCommon.mk
include device/fsl-proprietary/gpu-viv/fsl-gpu.mk

# Set target file system type
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_UBIFS := false

ADDITIONAL_BUILD_PROPERTIES += \
	ro.boot.storage_type=sd
TARGET_RECOVERY_FSTAB = device/udoo/udooneo_6sx/fstab.freescale
PRODUCT_COPY_FILES +=	\
	device/udoo/udooneo_6sx/fstab.freescale:root/fstab.freescale  \
	device/udoo/udooneo_6sx/fstab_sd.freescale:root/fstab.freescale.sd


TARGET_BOOTLOADER_BOARD_NAME := UDOONEO
PRODUCT_MODEL := UDOONEO-MX6SX

TARGET_RELEASETOOLS_EXTENSIONS := device/udoo/imx6

PRODUCT_PACKAGES += \
	sensors.UDOONEO \
	magd \
	HelloOpersysInternal \
	opersyshw.$(TARGET_BOARD_PLATFORM)

# Connectivity - Wi-Fi wlink8
BOARD_WLAN_VENDOR            := TI
BOARD_WLAN_DEVICE            := WILINK8
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB_WLINK8  := lib_driver_cmd_wl18xx
BOARD_HOSTAPD_PRIVATE_LIB_WLINK8         := lib_driver_cmd_wl18xx
COMMON_GLOBAL_CFLAGS += -DUSES_TI_MAC80211
COMMON_GLOBAL_CFLAGS += -DANDROID_P2P_STUB

TARGET_KERNEL_MODULES       := \
	drivers/misc/ti-st/st_drv.ko:system/lib/modules/st_drv.ko   \
	drivers/misc/ti-st/tty_hci.ko:system/lib/modules/tty_hci.ko \
	backports/net/mac80211/mac80211.ko:system/lib/modules/mac80211.ko \
	backports/net/wireless/cfg80211.ko:system/lib/modules/cfg80211.ko \
	backports/drivers/net/wireless/ti/wl18xx/wl18xx.ko:system/lib/modules/wl18xx.ko \
	backports/drivers/net/wireless/ti/wlcore/wlcore.ko:system/lib/modules/wlcore.ko \
	backports/drivers/net/wireless/ti/wlcore/wlcore_sdio.ko:system/lib/modules/wlcore_sdio.ko

PRODUCT_COPY_FILES +=   \
	hardware/ti/wlan/WILINK8/firmware/ti-connectivity/wl18xx-fw-4.bin:system/etc/firmware/ti-connectivity/wl18xx-fw-4.bin \
	hardware/ti/wlan/WILINK8/firmware/ti-connectivity/wl18xx-conf.bin:system/etc/firmware/ti-connectivity/wl18xx-conf.bin \
	hardware/ti/wlan/WILINK8/firmware/TIInit_11.8.32.bts:system/etc/firmware/TIInit_11.8.32.bts

#for accelerator sensor, need to define sensor type here
BOARD_HAS_SENSOR := true
SENSOR_MMA8451 := true

BOARD_KERNEL_CMDLINE := console=ttymxc0,115200 init=/init vmalloc=256M androidboot.console=ttymxc0 consoleblank=0 androidboot.hardware=freescale cma=128M androidboot.selinux=disabled androidboot.dm_verity=disabled no_console_suspend
BOARD_KERNEL_CMDLINE += uart_from_osc clk_ignore_unused

# Low RAM
PRODUCT_PROPERTY_OVERRIDES += \
	ro.config.low_ram=true \
	ro.config.max_starting_bg=8 \
	ro.sys.fw.bg_apps_limit=16

BOARD_HAVE_BLUETOOTH_TI := true
BOARD_HAVE_BLUETOOTH_BCM := false
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/udoo/udooneo_6sx/bluetooth

USE_ION_ALLOCATOR := false
USE_GPU_ALLOCATOR := true

BOARD_HAVE_IMX_CAMERA := false
TARGET_VSYNC_DIRECT_REFRESH := true

TARGET_UBOOT_VERSION := uboot-imx
TARGET_BOOTLOADER_CONFIG := imx6sx:udoo_neo_android_defconfig
TARGET_KERNEL_DEFCONF := udoo_neo_android_defconfig
TARGET_BOARD_DTS_CONFIG := imx6sx:imx6sx-udoo-neo-full-hdmi-m4.dtb

TARGET_KERNEL_MODULES += \
	arch/arm/boot/dts/imx6sx-udoo-neo-basic-hdmi-m4.dtb:system/dts/imx6sx-udoo-neo-basic-hdmi-m4.dtb \
	arch/arm/boot/dts/imx6sx-udoo-neo-basic-hdmi.dtb:system/dts/imx6sx-udoo-neo-basic-hdmi.dtb \
	arch/arm/boot/dts/imx6sx-udoo-neo-basic-lvds7-m4.dtb:system/dts/imx6sx-udoo-neo-basic-lvds7-m4.dtb \
	arch/arm/boot/dts/imx6sx-udoo-neo-basic-lvds7.dtb:system/dts/imx6sx-udoo-neo-basic-lvds7.dtb \
	arch/arm/boot/dts/imx6sx-udoo-neo-basic-lvds15-m4.dtb:system/dts/imx6sx-udoo-neo-basic-lvds15-m4.dtb \
	arch/arm/boot/dts/imx6sx-udoo-neo-basic-lvds15.dtb:system/dts/imx6sx-udoo-neo-basic-lvds15.dtb \
	arch/arm/boot/dts/imx6sx-udoo-neo-basic-m4.dtb:system/dts/imx6sx-udoo-neo-basic-m4.dtb \
	arch/arm/boot/dts/imx6sx-udoo-neo-basic.dtb:system/dts/imx6sx-udoo-neo-basic.dtb \
	arch/arm/boot/dts/imx6sx-udoo-neo-basicks-hdmi-m4.dtb:system/dts/imx6sx-udoo-neo-basicks-hdmi-m4.dtb \
	arch/arm/boot/dts/imx6sx-udoo-neo-basicks-hdmi.dtb:system/dts/imx6sx-udoo-neo-basicks-hdmi.dtb \
	arch/arm/boot/dts/imx6sx-udoo-neo-basicks-lvds7-m4.dtb:system/dts/imx6sx-udoo-neo-basicks-lvds7-m4.dtb \
	arch/arm/boot/dts/imx6sx-udoo-neo-basicks-lvds7.dtb:system/dts/imx6sx-udoo-neo-basicks-lvds7.dtb \
	arch/arm/boot/dts/imx6sx-udoo-neo-basicks-lvds15-m4.dtb:system/dts/imx6sx-udoo-neo-basicks-lvds15-m4.dtb \
	arch/arm/boot/dts/imx6sx-udoo-neo-basicks-lvds15.dtb:system/dts/imx6sx-udoo-neo-basicks-lvds15.dtb \
	arch/arm/boot/dts/imx6sx-udoo-neo-basicks-m4.dtb:system/dts/imx6sx-udoo-neo-basicks-m4.dtb \
	arch/arm/boot/dts/imx6sx-udoo-neo-basicks.dtb:system/dts/imx6sx-udoo-neo-basicks.dtb \
	arch/arm/boot/dts/imx6sx-udoo-neo-extended-hdmi-m4.dtb:system/dts/imx6sx-udoo-neo-extended-hdmi-m4.dtb \
	arch/arm/boot/dts/imx6sx-udoo-neo-extended-hdmi.dtb:system/dts/imx6sx-udoo-neo-extended-hdmi.dtb \
	arch/arm/boot/dts/imx6sx-udoo-neo-extended-lvds7-m4.dtb:system/dts/imx6sx-udoo-neo-extended-lvds7-m4.dtb \
	arch/arm/boot/dts/imx6sx-udoo-neo-extended-lvds7.dtb:system/dts/imx6sx-udoo-neo-extended-lvds7.dtb \
	arch/arm/boot/dts/imx6sx-udoo-neo-extended-lvds15-m4.dtb:system/dts/imx6sx-udoo-neo-extended-lvds15-m4.dtb \
	arch/arm/boot/dts/imx6sx-udoo-neo-extended-lvds15.dtb:system/dts/imx6sx-udoo-neo-extended-lvds15.dtb \
	arch/arm/boot/dts/imx6sx-udoo-neo-extended-m4.dtb:system/dts/imx6sx-udoo-neo-extended-m4.dtb \
	arch/arm/boot/dts/imx6sx-udoo-neo-extended.dtb:system/dts/imx6sx-udoo-neo-extended.dtb \
	arch/arm/boot/dts/imx6sx-udoo-neo-full-hdmi-m4.dtb:system/dts/imx6sx-udoo-neo-full-hdmi-m4.dtb \
	arch/arm/boot/dts/imx6sx-udoo-neo-full-hdmi.dtb:system/dts/imx6sx-udoo-neo-full-hdmi.dtb \
	arch/arm/boot/dts/imx6sx-udoo-neo-full-lvds7-m4.dtb:system/dts/imx6sx-udoo-neo-full-lvds7-m4.dtb \
	arch/arm/boot/dts/imx6sx-udoo-neo-full-lvds7.dtb:system/dts/imx6sx-udoo-neo-full-lvds7.dtb \
	arch/arm/boot/dts/imx6sx-udoo-neo-full-lvds15-m4.dtb:system/dts/imx6sx-udoo-neo-full-lvds15-m4.dtb \
	arch/arm/boot/dts/imx6sx-udoo-neo-full-lvds15.dtb:system/dts/imx6sx-udoo-neo-full-lvds15.dtb \
	arch/arm/boot/dts/imx6sx-udoo-neo-full-m4.dtb:system/dts/imx6sx-udoo-neo-full-m4.dtb \
	arch/arm/boot/dts/imx6sx-udoo-neo-full.dtb:system/dts/imx6sx-udoo-neo-full.dtb \

PRODUCT_COPY_FILES +=	\
	device/udoo/udooneo_6sx/uEnv.txt:system/uEnv.txt

BOARD_SEPOLICY_DIRS := \
       device/udoo/imx6/sepolicy \
       device/udoo/udooneo_6sx/sepolicy
