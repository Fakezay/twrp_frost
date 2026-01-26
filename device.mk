LOCAL_PATH := device/xiaomi/frost

# Copiar o fstab que você extraiu (ajuste o nome se for diferente)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/vendor/etc/fstab.jlq:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/etc/fstab.jlq

# Ativar suporte a AB (se o C40 for AB) ou outras flags de sistema
PRODUCT_SHIPPING_API_LEVEL := 30

