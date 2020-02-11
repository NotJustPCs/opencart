!/bin/bash
./config.sh

echo "$db_hostname"

echo "Remove themes"
rm -rf /home/gascentre/public_html/catalog/view/theme
mkdir /home/gascentre/public_html/catalog/view/theme

echo "Remove surplus vqmods"
rm -rf /home/gascentre/public_html/system/gdpr.ocmod.xml

echo "Remove old postcode checker"
rm -rf /home/gascentre/public_html/postcodechecker

echo "Remove planetholder"
rm -rf /home/gascentre/public_html/planetholder

echo "Remove vqmod"
rm -rf /home/gascentre/public_html/vqmod

echo "Make all database changes"
$db_connect "call pre0c3()"

# rm /home/gascentre/test.thegascentre.co.uk/*
echo "Delete the test storage folder"
rm -rf /home/gascentre/prd.storage

echo "Copy OC3 files from GitHub repo over the top of the working test site"
rsync -av --exclude-from '/home/gascentre/repositories/opencart-njpc-gc/ugscripts/copyexclusions.txt' /home/gascentre/repositories/opencart-njpc-gc/upload/ /home/gascentre/test.thegascentre.co.uk

echo "Delete the OC3 cache"
cd /home/gascentre/public_html/system/storage/cache
rm -R -- */
find . ! -name 'index.html' -type f -exec rm -f {} +

echo "Copy the edited OC3 config files over the existing ones"
rsync -av --exclude-from '/home/gascentre/repositories/opencart-njpc-gc/ugscripts/copyexclusions.txt' /home/gascentre/tmp/testsite/PostOC3ug/ /home/gascentre/public_html
