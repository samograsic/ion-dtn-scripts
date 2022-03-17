#!/bin/bash
echo "Adding Node:$1 to ION..."
cd /home/pi/dtn/guestconfig/
ionadmin $1-ionadmin.rc
ltpadmin $1-ltpadmin.rc
bpadmin $1-bpadmin.rc
ipnadmin $1-ipnadmin.rc
echo "Configuration for ipn:$1 added to ION..."
exit 0

