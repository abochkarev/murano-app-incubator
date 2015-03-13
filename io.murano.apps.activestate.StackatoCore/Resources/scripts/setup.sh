#!/bin/bash
# $1 - IP address of the node
# $2 - DNS name of the node
chmod u+w /etc/sudoers
echo "stackato        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers

chmod u-w /etc/sudoers
/home/stackato/bin/kato node rename $2
/home/stackato/bin/kato node migrate 127.0.0.1 $1
#/home/stackato/bin/kato node restart
sleep 240
echo "$1 $2" >> /etc/hosts

/home/stackato/bin/kato node setup core api.$2
sleep 120
#/home/stackato/bin/kato node setup core api.$1
