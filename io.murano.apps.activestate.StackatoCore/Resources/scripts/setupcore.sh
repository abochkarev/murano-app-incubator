#!/bin/bash
# $1 - IP address of the node
# $2 - DNS name of the node
#chmod u+w /etc/sudoers
#echo "stackato        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers

#chmod u-w /etc/sudoers

#su -l stackato -c "/home/stackato/bin/kato node migrate 127.0.0.1 $1"
#sleep 120
#su -l stackato -c "/home/stackato/bin/kato node rename $2"
#/home/stackato/bin/kato node restart
API_NAME=api.$2
#echo "$1 $2" >> /etc/hosts
#echo "$1 $API_NAME" >> /etc/hosts
su -l stackato -c "/home/stackato/bin/kato node setup core api.$2"
sleep 240
#su -l stackato -c "/home/stackato/bin/kato node rename $2"
#/home/stackato/bin/kato node setup core api.$1
