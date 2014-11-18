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

#Add quick rebuild to buildroot Makefile
if grep -F 'quickrebuild' buildroot/Makefile ; then
	echo 'quickrebuild already in Buildroot Makefile'
else
	echo 'Added quickrebuild to Buildroot Makefile'
	line='rm -rf $(TARGET_DIR) $(STAGING_DIR) $(STAMP_DIR) $(BUILD_DIR)/.root $(BUILD_DIR)/*/.stamp_target_installed $(BUILD_DIR)/*/.stamp_staging_installed $(BUILD_DIR)/linux-*/.stamp_installed $(BUILD_DIR)/*/.built'
	echo -e "\nquickrebuild:\n\t$line\n" >> buildroot/Makefile
fi

cd buildroot
make
#make V=s 2>&1 | tee build.log | grep -i error
