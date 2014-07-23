#!/bin/sh
#
# Firebrick 
# last edit 23/07/2014 - Lee Tobin

export CONFIGFS=/sys/kernel/config
export TARGET=/sys/kernel/config/target/core
export FABRIC=/sys/kernel/config/target/iscsi

#create a IBLOCK HBA and virtual storage object
mkdir -p $TARGET/iblock_0/lvm_test0
# Tell the virtual storage object what struct block_device we want
echo "udev_path=/dev/$evidenceDisk" > $TARGET/iblock_0/lvm_test0/control
echo "readonly=1" > $TARGET/iblock_0/lvm_test0/control
# Enable the virtual storage object and call bd_claim()
echo 1 > $TARGET/iblock_0/lvm_test0/enable

DEF_IQN="iqn.2003-01.org.linux-iscsi.target.i686:sn.e475ed6fcdd0"

#create the network portal on $DEF_IQN/tpgt_1
mkdir -p "$FABRIC/$DEF_IQN/tpgt_1/np/192.168.0.1:3260"
# Create LUN 0 on $DEF_IQN/tpgt_1
mkdir -p "$FABRIC/$DEF_IQN/tpgt_1/lun/lun_0"
# Create the iSCSI Target Port Mapping for $DEF_IN/tpgt_1 LUN 0
# to lvm_test0 and give it the port symbolic name of lio_west_port
ln -s $TARGET/iblock_0/lvm_test0 "$FABRIC/$DEF_IQN/tpgt_1/lun/lun_0/lio_west_port"

# Allow iSCSI Initiators to login to $DEF_IQN/tpgt_1
#warning Currently uses generate_node_acls=1,cache_dynamic_acls=1,demo_mode_lun_access=1
echo 1 > $FABRIC/$DEF_IQN/tpgt_1/enable

