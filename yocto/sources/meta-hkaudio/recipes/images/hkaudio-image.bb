inherit core-image

SUMMARY="Hirschkaefer audio image"

EXTRA_IMAGE_FEATURES += "package-management"

IMAGE_INSTALL += "\
  alsa-equal \
  alsa-utils \
  ca-certificates \
  curl \
  go-librespot \
  jq \
  librespot \
  linux-firmware-rtl8822 \
  lirc \
  res-man \
  room-config \
  squeezelite \
  vim \
"
