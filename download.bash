#!/bin/bash

XORG=working/xorg
EVDEV=working/evdev

function move() {
for file in *
do
    mv $file ${file%%\?*}
done
}

mkdir -p $XORG
( 
    cd $XORG
    cat ../../xorg-server-pkg-1.13.1-1.urls | wget -i- 
    move
)
mkdir -p $EVDEV
(
    cd $EVDEV
    cat ../../xf86-input-evdev-2.7.3-2.urls | wget -i-
    move
)

# TODO ; patch strings in PKGBUILD
# TODO ; install base-devel
