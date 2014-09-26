# FIREBrick 3
==========

Software for the open source hardware write-blocker/imager.

##### FIREBrick features:

* Disk imaging at speeds of up to 5Gb per minute (disk dependent)
* iSCSI write blocker function
* Supports disk encryption
* Automatic RAID storage detection
* Web frontend
* Portable – fits in a small HTPC case
* Free, open source
* Can be fully customized to the needs of specific departments

To build a FIREBrick you need:

* ASRock E350M1 Motherboard
* >= 1Gb DDR3 Desktop RAM (1333 or 1066)
* Power supply/Case

This version of the FIREBrick runs a webserver, providing a web frontend. The user connects to the FIREBrick via an ethernet cable, the system provides an IP address via DHCP (192.168.0.x). Frontend accessible via a web browser (192.168.0.1).

This build needs a little more work, currently has basic working functionality; A disk can be exported over iSCSI.

###### For UCD MSc students:
[Jira/Confluence](https://firebrick.atlassian.net/wiki/display/SC/Build+notes)


# Getting Started:

* Download Ubuntu Server latest. http://www.ubuntu.com/download/server
* Download and install VirtualBox latest. https://www.virtualbox.org/
* Create and boot a VM using the Ubuntu Server ISO. (~2Gb RAM and >25Gb HD)
* Install git, build-essential, unzip on the VM (sudo apt-get install git build-essential unzip)
* /firebrick3/extraFiles/start.sh (wait a bit)
* You will now have a bzImage /firebrick3/buildroot/output/images
* Create a bootable USB (using sys-linux or similar and use the bzImage)
