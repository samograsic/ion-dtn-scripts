## General info
This set of scripts can be used to add a new DTN node while ION is already running (without restarting). All exaple files are taken from the DTN Christmas Challange 2021.

This repository consists of two folders: 
* hostconfig (includes ION node start-up configuration file)
* guestconfig (includes a template and example of configuration fies that is generated and applied after ION is started)

This script was used together with a Node-Red folow that allwed users to enter their own DTN node ID and node's public IP address. After, node-red flow called create.sh scripts with ID and IP as arguments (e.g., ./create.sh 102 123.123.123.123).
The script than generated four ion configuration files from the template (using sed command that replaced strings NNN with node's ID and XXX with IP address). All the generated files were located in the /guestconfig folder.

```
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
```

These new configuration files were than applied to the ION using the applyconfig.sh bash script. This script called the stadard ionadmin, ltpadmin, bpadmin and ipnadmin commands. 

```
#!/bin/bash
echo "Adding Node:$1 to ION..."
cd /home/pi/dtn/guestconfig/
ionadmin $1-ionadmin.rc
ltpadmin $1-ltpadmin.rc
bpadmin $1-bpadmin.rc
ipnadmin $1-ipnadmin.rc
echo "Configuration for ipn:$1 added to ION..."
exit 0 
```

Note that everytime ion gets restarted, a node needs to go throught guestconf config folder and add all individal configuration files again to the Ion.

