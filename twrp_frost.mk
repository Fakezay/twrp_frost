# Herdar configurações básicas do TWRP/Omni
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product, vendor/twrp/config/common.mk)

# Herdar o arquivo device.mk que vamos criar
$(call inherit-product, device/xiaomi/frost/device.mk)

# Informações do Produto
PRODUCT_DEVICE := frost
PRODUCT_NAME := twrp_frost
PRODUCT_BRAND := Poco
PRODUCT_MODEL := Poco C40
PRODUCT_MANUFACTURER := xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

