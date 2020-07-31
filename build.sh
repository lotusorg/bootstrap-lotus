#!/usr/bin/env bash

scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

mkdir ${scriptdir}/builddir
mkdir ${scriptdir}/bin

cd ${scriptdir}

meson setup builddir --cross-file x86_64-elf.ini
cd builddir
ninja

git clone https://github.com/qloader2/qloader2 ${scriptdir}/builddir/qloader2

dd if=/dev/zero of=lotus.img bs=1M count=20
parted -s lotus.img mklabel msdos
parted -s lotus.img mkpart primary 1 100%
echfs-utils -m -p0 lotus.img format 512

echfs-utils -m -p0 lotus.img import ${scriptdir}/builddir/subprojects/lotus/src/lotus /boot/lotus
echfs-utils -m -p0 lotus.img import ${scriptdir}/src/qloader2.cfg /boot/qloader2.cfg

cd qloader2 && ./qloader2-install ${scriptdir}/builddir/qloader2/qloader2.bin ../lotus.img