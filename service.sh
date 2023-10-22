#!/system/bin/sh

# Wait till device boot process completes
while [ "$(getprop sys.boot_completed)" != "1" ]; do
    sleep 1
done

# Start Telnet daemon
busybox telnetd -l /system/bin/sh && \
su -lp 2000 -c "cmd notification post -S bigtext -t 'Umbrella Corporation ROM' 'Umbrella' 'Telnet daemon running...'" >/dev/null 2>&1 || \
su -lp 2000 -c "cmd notification post -S bigtext -t 'Umbrella Corporation ROM' 'Umbrella' 'Telnet daemon not running...'" >/dev/null 2>&1
