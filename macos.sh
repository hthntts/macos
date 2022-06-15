#!/usr/bin/env bash
if [ -z "$1" ]; then
    echo Usage: $0 {MACOS_NAME}
    exit 1
fi

sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

MACOS_NAME=$1
echo '\n---- Config Hostname'
sudo scutil --set HostName $MACOS_NAME
sudo scutil --set LocalHostName $MACOS_NAME
sudo scutil --set ComputerName $MACOS_NAME
dscacheutil -flushcache

echo '\n---- Disable Policy'
sudo spctl --master-disable

echo '\n---- Install Xcode Command Line Tools'
xcode-select --install

echo '\n---- Install Homebrew'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo ''
