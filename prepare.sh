#!/bin/bash

IP="192.168.1.100"

echo "Cleaning possible files"
rm -rf www-data/ 2> /dev/null
rm -rf db-data/ 2> /dev/null
rm -rf db-init/ 2> /dev/null
# entering the input folder
cd input/
echo "Unzipping www data"
unzip data.zip > /dev/null
mv data ../www-data
echo "Extracting SQL backup file"
mkdir ../db-init/ 2> /dev/null
unzip *.sql.zip > /dev/null
mv *.sql ../db-init/init.sql
# going back to main folder
cd ..
cd www-data/
# going into www-data folder
mv LocalSettings.php LocalSettings_old.php
cat LocalSettings_old.php | sed -e 's/localhost/'$IP'/g' | sed -e 's/https:\/\/wiki.ge.cnr.it/http:\/\/localhost:8080/g' > LocalSettings.php
# going back to main folder
cd ..
echo "Done!"
