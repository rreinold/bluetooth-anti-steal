#!/bin/sh
# usage: ./install.sh
set -e
cd "$(dirname "$0")"
brew install blueutil sleepwatcher
ln -sfn "$PWD/sleep" ~/.sleep
ln -sfn "$PWD/wakeup" ~/.wakeup
printf 'Auto-reconnect to the last connected devices on wake? [y/N] '
read -r answer
case "$answer" in
  [yY]*) touch ~/.bt_reconnect ;;
  *) rm -f ~/.bt_reconnect ;;
esac
brew services restart sleepwatcher
