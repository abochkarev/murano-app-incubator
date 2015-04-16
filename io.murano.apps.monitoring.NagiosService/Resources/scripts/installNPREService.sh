#!/bin/bash
function include(){
    curr_dir=$(cd $(dirname "$0") && pwd)
    inc_file_path=$curr_dir/$1
    if [ -f "$inc_file_path" ]; then
        . $inc_file_path
    else
        echo -e "$inc_file_path not found!"
        exit 1
    fi
}
include "common.sh"

bash installer.sh -p sys -i "nrpe.x86_64 nagios-plugins-nrpe.x86_64 nagios-plugins-nwstat.x86_64 nagios-plugins-load.x86_64"
#yum install nagios-plugins-nrpe.x86_64 nagios-plugins-nwstat.x86_64 nagios-plugins-log.x86_64
#iptables -I IN_public_allow 2 -p tcp -m tcp --dport 5666 -m conntrack --ctstate NEW -j ACCEPT
add_fw_rule '-I INPUT 1 -p tcp -m tcp --dport 5666 -j ACCEPT -m comment --comment "by murano, Nagios"'

sed -i.bak "s/%MASTER%/$1/g" nrpe.cfg
cp nrpe.cfg /etc/nagios/nrpe.cfg

service nrpe restart
chkconfig nrpe on