#!/usr/bin/env bash

set -euo pipefail

DEB_FILE=${DEB_FILE-"dist/func-e_dev_linux_amd64.deb"}

echo installing "${DEB_FILE}"
dpkg -i "${DEB_FILE}" || exit 1

echo ensuring func-e was installed
func-e -version || exit 1

echo uninstalling func-e
apt-get remove "${DEB_FILE}" || exit 1

echo ensuring func-e was uninstalled
func-e -version && exit 1

exit 0
