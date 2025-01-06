#!/bin/bash -e

bitbake package-index
cd $BUILDDIR/tmp/deploy/ipk
python3 -m http.server 8080
