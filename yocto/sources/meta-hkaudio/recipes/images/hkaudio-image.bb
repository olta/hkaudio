inherit core-image

SUMMARY="Hirschkaefer audio image"

EXTRA_IMAGE_FEATURES += "package-management"

IMAGE_INSTALL += "\
  alsa-equal \
  alsa-utils \
  atop \
  ca-certificates \
  curl \
  daily-reboot \
  go-librespot \
  htop \
  iwd \
  jq \
  librespot \
  linux-firmware-mediatek \
  linux-firmware-mt76x2 \
  linux-firmware-rtl8822 \
  lirc \
  res-man \
  room-config \
  squeezelite \
  vim \
"

IMAGE_ROOTFS_SIZE = "1310720"
IMAGE_OVERHEAD_FACTOR = "1.0"
