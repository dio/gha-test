#!/usr/bin/env bash

set -euo pipefail

PACKAGING=${PACKAGING:-deb}
ARCH=${ARCH:-amd64}
PKG_FILE=${PKG_FILE:-dist/func-e_dev_linux_${ARCH}.${PACKAGING}}

declare -A install=(["deb"]="dpkg -i" ["rpm"]="rpm -i")
declare -A uninstall=(["deb"]="apt remove -yqq" ["rpm"]="rpm -e")

${install[${PACKAGING}]} ${PKG_FILE}
func-e versions
${uninstall[${PACKAGING}]} func-e
