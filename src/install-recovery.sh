#!/system/bin/sh

if [ -f /sdcard/stop ]
then
	exit
fi

for scr in /etc/init.d/*
do
	$scr &
done

