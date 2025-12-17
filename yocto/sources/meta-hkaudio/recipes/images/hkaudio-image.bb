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
  linux-firmware-mediatek \
  linux-firmware-mt76x2 \
  lirc \
  res-man \
  room-config \
  squeezelite \
  vim \
"

# instead of installing all (1844) kernel modules, just install the ones we need (making use of package dependencies to reduce the list)
IMAGE_INSTALL += "\
  kernel-module-aes-arm64 kernel-module-af-alg kernel-module-algif-aead kernel-module-algif-hash kernel-module-algif-skcipher \
  kernel-module-bcm2835-codec kernel-module-bcm2835-isp kernel-module-bcm2835-v4l2 \
  kernel-module-cbc kernel-module-ccm kernel-module-cmac kernel-module-ctr \
  kernel-module-fuse \
  kernel-module-gcm kernel-module-ghash-ce kernel-module-ghash-generic kernel-module-gpio-ir-recv \
  kernel-module-ipv6 kernel-module-ir-rc6-decoder \
  kernel-module-md4 kernel-module-md5 kernel-module-mt76x2u kernel-module-mt7921u \
  kernel-module-nfnetlink \
  kernel-module-pkcs8-key-parser \
  kernel-module-raspberrypi-gpiomem kernel-module-raspberrypi-hwmon \
  kernel-module-sch-fq-codel kernel-module-sha1-generic kernel-module-sha512-arm64 kernel-module-sha512-generic \
  kernel-module-snd-bcm2835 kernel-module-snd-soc-bcm2835-i2s kernel-module-snd-soc-pcm5102a kernel-module-snd-soc-rpi-simple-soundcard \
  kernel-module-uio-pdrv-genirq \
"

IMAGE_ROOTFS_SIZE = "1310720"
IMAGE_OVERHEAD_FACTOR = "1.0"
