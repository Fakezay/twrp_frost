# BoardConfig.mk para Poco C40 (frost) - JLQ JR510
# Gerado com base em dump de vendor_boot v3

DEVICE_PATH := device/xiaomi/frost

# Arquitetura do Processador
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := frost
TARGET_NO_BOOTLOADER := true

# Kernel e DTB (Prebuilt)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_INCLUDE_RECOVERY_DTBO := true

# --- CONFIGURAÇÃO DE BOOT (EXTRAÍDO) ---
BOARD_BOOT_HEADER_VERSION := 3

# Endereços de Memória (Base 0x00000000 inferida dos logs)
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_TAGS_OFFSET := 0x00000100
BOARD_DTB_OFFSET := 0x01f00000

# Linha de Comando (CMDLINE) - Extraída do vendor_boot
BOARD_KERNEL_CMDLINE := security=selinux androidboot.hardware=jlq iommu.strict=0 firmware_class.path=/etc/firmware swiotlb=2048 rcu_nocbs=0-7 kpti=off rcupdate.rcu_expedited=1 earlycon=uart8250,mmio32,0x3450F000 console=jlqttyS1,115200n8 no_console_suspend loglevel=4 buildvariant=user

# Configurações do Vendor Boot (Header v3)
# Atenção: O TWRP será injetado aqui.
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true

# Tamanho das Partições
# O ramdisk do vendor deu ~42MB. Definindo partição como 64MB (padrão seguro)
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_FLASH_BLOCK_SIZE := 131072 # 128kb padrão, ajuste se souber o real

# Partições Dinâmicas (Super Partition)
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := xiaomi_dynamic_partitions
BOARD_XIAOMI_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor product odm
BOARD_XIAOMI_DYNAMIC_PARTITIONS_SIZE := 9122611200

# Configurações do TWRP
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
TW_INCLUDE_NTFS_3G := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
# Se der erro de tela preta, tente alterar o brightness path acima

# Criptografia (Android 11 FBE)
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
BOARD_USES_METADATA_PARTITION := true

# Ignorar erros de dependências de módulos (Comum em builds minimal)
BUILD_BROKEN_MISSING_REQUIRED_MODULES := true
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true


# Forçar a versão do header nos argumentos do mkbootimg
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

# Adicionar o DTB ao vendor_boot (essencial para Header v3)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
