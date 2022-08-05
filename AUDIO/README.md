# Membuat android bisa bunyi linuxnya
1. Agar android bisa bunyi pertama-tama di termux harus di setup pulseaudio terlebih dahulu

```
bash setup-pulseaudio.sh
```

2. Agar bisa di play lewat linux lain, maka harus tambahkan config lagi di default.pa

/etc/pulse/default.pa
```
load-module module-native-protocol-tcp auth-anonymous=true port=12345
```

dan pastikan sudah load-module opensles juga di default.pa. Jika belum, tambahkan
```
load-module module-sles-sink
```

3. Agar bisa di play di linux lain dengan (proot-distro login), set dulu environment variable nya
```
export PULSE_SERVER=tcp:127.0.0.1:12345
```

4. Bisa dicoba menggunakan mpv atau mplayer untuk play music dengan ao pulse
