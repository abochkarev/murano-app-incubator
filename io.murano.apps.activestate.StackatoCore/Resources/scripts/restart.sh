#!/bin/bash
# $1 - IP address of the node
# $2 - DNS name of the node
su -l stackato -c "/home/stackato/bin/kato restart"
sleep 20
#su -l stackato -c "/home/stackato/bin/kato node rename $2"
#/home/stackato/bin/kato node restart
#API_NAME=api.$2
#echo "$1 $2" >> /etc/hosts
#echo "$1 $API_NAME" >> /etc/hosts
#su -l stackato -c "/home/stackato/bin/kato node setup core api.$2"
#sleep 100
#su -l stackato -c "/home/stackato/bin/kato node rename $2"
#/home/stackato/bin/kato node setup core api.$1
