#!/bin/sh
#
# Firebrick main script
# last edit Thu 24 Jul 2014 11:07:30 IST - Lee Tobin

#Storage check
export storageDisk1=$(ls -la /sys/block | grep ata. | grep host2 | grep -o sd. | tail -1)
export storageDisk2=$(ls -la /sys/block | grep ata. | grep host3 | grep -o sd. | tail -1)

# check the situation with storage
if [[ ${#storageDisk1} -gt 2  &&  ${#storageDisk2} -gt 2 ]] ; then #RAID
	export storageDevice="/dev/md0"
elif [ ${#storageDisk1} -gt 2 ] ; then #single disk
	export storageDevice="/dev/${storageDisk1}"
elif [ ${#storageDisk2} -gt 2 ] ; then #single disk
	export storageDevice="/dev/${storageDisk2}"	
else
	#No disks!!!
	export storageDevice=""
fi

echo Storage found on:$storageDevice

#Call the main script
sh main.sh 
