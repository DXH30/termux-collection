#!/data/data/com.termux/files/usr/bin/sh

TERMUX_PREFIX=~/../usr

# Do not shutdown server when idle.
sed -i $TERMUX_PREFIX/etc/pulse/daemon.conf \
    -e '/^; exit-idle-time =/{s/^; //;s/ 20/ -1/}'

# When no sinks are available, Pulseaudio automatically adds a null sink named 'auto_null'.

# Stream the 'auto_null' sink over TCP.
# This can be played by Simple Protocol Player app on Google Play.
sed -i $TERMUX_PREFIX/etc/pulse/default.pa \
    -e '$aload-module module-simple-protocol-tcp source=auto_null.monitor port=12345 record=true'

# In addition, or alternatively,
# add a null sink named 'rtp' and stream it over RTP.
# This can be played by VLC, etc.
# sed -i $TERMUX_PREFIX/etc/pulse/default.pa \
#     -e '/^#load-module module-null-sink sink_name=rtp /s/#//' \
#     -e '/^#load-module module-rtp-send source=rtp.monitor$/s/#//'
