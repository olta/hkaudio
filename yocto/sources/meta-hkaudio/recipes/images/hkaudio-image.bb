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
  ${@'lirc' if d.getVar('HKAUDIO_LIRC', True) == '1' else ''} \
  res-man \
  squeezelite \
  vim \
"
