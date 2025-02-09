inherit core-image

SUMMARY="Hirschkaefer audio image"

EXTRA_IMAGE_FEATURES += "package-management"

IMAGE_INSTALL += "\
  alsa-equal \
  alsa-utils \
  ca-certificates \
  curl \
  go-librespot \
  iwd \
  jq \
  librespot \
  linux-firmware-mt76x2 \
  linux-firmware-rtl8822 \
  lirc \
  res-man \
  room-config \
  squeezelite \
  vim \
"
