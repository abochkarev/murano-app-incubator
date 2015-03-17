#!/bin/bash
# $1 - role
# $2 - core IP
# $3 - apiURL
chmod u+w /etc/sudoers
echo "stackato        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
chmod u-w /etc/sudoers
API_NAME=api.$3
echo "$2 $API_NAME" >> /etc/hosts
echo "$2 $3" >> /etc/hosts
su -l stackato -c "/home/stackato/bin/kato node reset services"
sleep 20
su -l stackato -c "/home/stackato/bin/kato node attach -e $1 $2"