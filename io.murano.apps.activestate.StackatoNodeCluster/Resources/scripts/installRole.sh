#!/bin/bash
# $1 - role
# $2 - core IP
# $3 - apiURL
chmod u+w /etc/sudoers
echo "stackato        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
chmod u-w /etc/sudoers

echo "$2 $3" >> /etc/hosts
/home/stackato/bin/kato node attach -e $1 $2