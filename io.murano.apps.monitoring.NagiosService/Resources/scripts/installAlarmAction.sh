#!/bin/bash
# $1 = action name
# $2 = action url


# Add Murano notification actions for specific action name
grep $1 /tmp/actions
 if [ "$?" != "0" ]; then
    sed -i.bak "s/%ACTION%/$1/g" commands_alarm.cfg
    cat commands_alarm.cfg >> /etc/nagios/objects/commands.cfg
    echo $1 >> /tmp/actions
    echo "MURANO_ALARM_ENDPOINT=$2" > /etc/nagios/murano_$1.sh
    service nagios restart
 fi



