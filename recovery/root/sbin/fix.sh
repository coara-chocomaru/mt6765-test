#!/sbin/sh
pid=$(getprop sys.usb.pid)
if [ "$pid" != "0x4EE0" ] && [ "$pid" != "0x4ee0" ] && [ "$pid" != "4EE0" ] && [ "$pid" != "4ee0" ]; then
resetprop sys.usb.pid 0x4EE0
resetprop sys.usb.config fastboot
resetprop persist.sys.usb.config fastboot
start fastbootd
exit 0
fi
if [ -z "$(getprop ro.twrp.fastbootd)" ] || [ "$(getprop ro.twrp.fastbootd)" = "0" ]; then
resetprop ro.twrp.fastbootd 1
fi
if [ "$(getprop ro.twrp.fastbootd)" = "1" ] && [ "$(getprop sys.usb.config)" != "fastboot" ]; then
resetprop sys.usb.pid 0x4EE0
resetprop sys.usb.config fastboot
resetprop persist.sys.usb.config fastboot
start fastbootd
fi
exit 0
