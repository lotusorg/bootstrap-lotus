#!/usr/bin/env bash

scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

rm -rf ${scriptdir}/builddir

rm -rf ${scriptdir}/subprojects/lotus
rm -rf ${scriptdir}/subprojects/printf