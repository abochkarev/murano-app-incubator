#!/bin/bash

sed -i.bak "s/%IP%/$1/g" service-cpu-load.cfg
sed -i.bak "s/%HOST%/$2/g" service-cpu-load.cfg
sed -i.bak "s/%WARNING%/$3/g" service-cpu-load.cfg
sed -i.bak "s/%CRITICAL%/$4/g" service-cpu-load.cfg
sed -i.bak "s/%ACTION%/$5/g" service-cpu-load.cfg

#sed -i.bak "s/%IP%/$1/g" host-entry.cfg
#sed -i.bak "s/%HOST%/$2/g" host-entry.cfg

#cat  host-entry.cfg >> /etc/nagios/conf.d/murano-entry.cfg
cat service-cpu-load.cfg >> /etc/nagios/conf.d/murano-entry.cfg

# Configure Murano endpoint info
echo "MURANO_ALARM_ENDPOINT=$3" > /etc/nagios/murano.sh

service nagios restart