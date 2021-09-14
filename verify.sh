#!/usr/bin/env bash

set -euo pipefail

PACKAGING=${PACKAGING:-deb}
ARCH=${ARCH:-amd64}

declare -A install=(["deb"]="dpkg -i" ["rpm"]="rpm -i")
declare -A uninstall=(["deb"]="apt remove -yqq" ["rpm"]="rpm -e")

${install[${PACKAGING}]} func-e_dev_linux_${ARCH}.${PACKAGING}
func-e versions
${uninstall[${PACKAGING}]} func-e_dev_linux_${ARCH}.${PACKAGING}
