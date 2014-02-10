# This is what you run after you've clone the firebrick3 repo
cd firebrick3
cp extraFiles/configs/buildroot.config buildroot/.config
cp extraFiles/package/dcfldd buildroot/package -r

#Add fstab entries
if grep -F 'dcfldd' buildroot/package/Config.in ; then
	echo 'dcfldd line present in Config.in not adding...'
else
	sed -i '/^menu "Target packages"/a source "package/dcfldd/Config.in"' buildroot/package/Config.in
fi

cd buildroot
make V=s 2>&1 | tee build.log | grep -i error