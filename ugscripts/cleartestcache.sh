# Clear cache
cd /home/gascentre/test.thegascentre.co.uk/system/storage/cache
rm -R -- */
find . ! -name 'index.html' -type f -exec rm -f {} +
