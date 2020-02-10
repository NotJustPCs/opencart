!/bin/bash
./config.sh

echo "Move the storage folder as per the OC3 guidelines"
mv /home/gascentre/public_html/system/storage/ /home/gascentre/prd.storage

echo "Remove the OC install folder"
rm -r /home/gascentre/public_html/install

#echo "Copy the chosen theme over the current OC3"
#rsync -av --exclude-from '/home/gascentre/repositories/opencart-njpc-gc/ugscripts/copyexclusions.txt' /home/gascentre/repositories/opencart-njpc/themeupload/ /home/gascentre/test.thegascentre.co.uk
