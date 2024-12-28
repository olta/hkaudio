inherit core-image

SUMMARY="Hirschkaefer audio image"

IMAGE_INSTALL += "\
  alsa-equal \
  alsa-utils \
  ca-certificates \
  curl \
  go-librespot \
  jq \
  librespot \
  res-man \
  squeezelite \
  vim \
"
