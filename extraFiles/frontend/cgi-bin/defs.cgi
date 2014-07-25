#!/bin/sh

#Export the evidence drive
CONFIGFS=/sys/kernel/config
TARGET=/sys/kernel/config/target/core
FABRIC=/sys/kernel/config/target/iscsi
DEF_IQN="iqn.2003-01.org.linux-iscsi.target.i686:sn.e475ed6fcdd0"
EV_DISK=$(ls -la /sys/block | grep ata. | grep host0 | grep -o sd. | tail -1) 	#find the disk
