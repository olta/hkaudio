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
  ${@'lirc' if d.getVar('HKAUDIO_LIRC', True) == '1' else ''} \
  res-man \
  squeezelite \
  vim \
"
