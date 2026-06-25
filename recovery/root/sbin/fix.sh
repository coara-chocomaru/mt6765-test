#!/sbin/sh

current_config=$(getprop sys.usb.config)
current_pid=$(getprop sys.usb.pid)

pid_lower=$(echo "$current_pid" | tr 'A-F' 'a-f' | sed 's/^0x//')

if [ "$pid_lower" != "4ee0" ]; then
    resetprop sys.usb.pid 0x4EE0
fi

if [ "$current_config" != "fastboot" ]; then
    resetprop sys.usb.config none
    sleep 0.3
    resetprop sys.usb.config fastboot
    resetprop persist.sys.usb.config fastboot
fi

if [ "$(getprop ro.twrp.fastbootd)" != "1" ]; then
    resetprop ro.twrp.fastbootd 1
fi

start fastbootd
exit 0
