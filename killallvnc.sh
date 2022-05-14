#!/usr/bin/sh
pulseaudio -k
vncserver -kill :1
rm -rfv /tmp/.X*-lock
rm -rfv /tmp/.X11-unix/X*
