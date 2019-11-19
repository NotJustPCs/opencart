. config.sh

# Move the storage folder as per the OC3 guidelines
mv /home/gascentre/test.thegascentre.co.uk/system/storage/ /home/gascentre/test.storage

# Remove the OC install folder
rm -r /home/gascentre/test.thegascentre.co.uk/install

# Copy the chosen theme over the current OC3
#rsync -av --exclude-from '/home/gascentre/repositories/opencart-njpc-gc/copyexclusions.txt' /home/gascentre/repositories/opencart-njpc/themeupload/ /home/gascentre/test.thegascentre.co.uk
