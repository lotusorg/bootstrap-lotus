#!/usr/bin/env bash

scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

qemu-system-x86_64 -m 2G ${scriptdir}/builddir/lotus.img