#!/bin/sh

case "$1" in
  1)
    $0 stop 
    pactl load-module module-simple-protocol-tcp rate=48000 format=s16le channels=2 source=1 record=true port=9250
    ;;
  2)
    pactl unload-module `pactl list | grep tcp -B1 | grep M | sed 's/[^0-9]//g'`
    ;;
esac
