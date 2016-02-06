#!/bin/sh

set -e
set -u

setup(){
  Brewfile=$HOME/Brewfile
  launchd=$HOME/Library/LaunchAgents

  if [ ! -d "$Brewfile" ]; then
      git clone -b backup-brewfile git@github.com:munisystem/Brewfile "$Brewfile"
  fi

  if [ ! -d "$launchd" ]; then
    mkdir "$launchd"
  fi

  cp -f "$Brewfile/dump.brewfile.plist" "$launchd/dump.brewfile.plist"
  sudo cp -f "$Brewfile/launchd.conf" "/etc/launchd.conf"
  launchctl load ~/Library/LaunchAgents/dump.brewfile.plist
}

setup
