#!/system/bin/sh

INIT="/system/etc/init.d"
BIN="/system/bin"
NEXT_OS=$1

ban()
{
	clear
	echo "###############################"
	echo "#  HELO AUTORUNNER INSTALLER  #"
	echo "###############################"
	echo
}

chkintdir()
{
	echo -n "[#]Placing Scripts...  "
	
	if [ ! -d $INIT ]
	then
		mkdir $INIT
		chmod 755 $INIT
	fi
	cp src/autoscr $INIT
	cp src/btime $INIT
	cp src/helo $INIT
	cp src/install-recovery.sh $BIN
	chmod 755 $INIT/autoscr
	chmod 755 $INIT/helo
	chmod 000 $INIT/btime
	chmod 755 $BIN/install-recovery.sh
	sleep 0.5
	echo "Done"
}

nextos()
{
	if [ ! -z $NEXT_OS ]
	then
		echo -n "[#]Inserting Next Boot OS...  "
		sed -i "s/NEXT_OS/$NEXT_OS/" $INIT/autoscr
		echo "Done"
	else
		echo "[!]Next Boot OS Not Injected In Autoscript"
	fi
}

############################################################

ban
chkintdir
nextos
