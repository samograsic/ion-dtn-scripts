#!/bin/bash
echo "Creating configuration files for node:$1 with ip:$2..."
cd /home/pi/dtn/guestconfig/template/
cp template_ionadmin.rc ../$1-ionadmin.rc
cp template_ltpadmin.rc ../$1-ltpadmin.rc
cp template_bpadmin.rc ../$1-bpadmin.rc
cp template_ipnadmin.rc ../$1-ipnadmin.rc
echo “Configuration files ready...”
cd ..
sed -i 's/NNN/'$1'/g' $1-ionadmin.rc $1-ltpadmin.rc $1-bpadmin.rc $1-ipnadmin.rc
sed -i 's/XXX/'$2'/g' $1-ionadmin.rc $1-ltpadmin.rc $1-bpadmin.rc $1-ipnadmin.rc
exit 0


