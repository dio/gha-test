#!/usr/bin/env bash

set -euo pipefail

PKG=${PKG:-deb}
ARCH=${ARCH:-amd64}

declare -A install=(["deb"]="dpkg -i" ["rpm"]="rpm -i")
declare -A uninstall=(["deb"]="apt remove -yqq" ["rpm"]="rpm -e")

${install[${PKG}]} func-e_dev_linux_${ARCH}.${PKG}
func-e versions
${install[${PKG}]} func-e_dev_linux_${ARCH}.${PKG}
