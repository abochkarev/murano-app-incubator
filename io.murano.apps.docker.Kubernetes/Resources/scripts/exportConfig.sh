#!/bin/bash

DEFINITION_DIR=/var/run/murano-kubernetes
cd $DEFINITION_DIR

echo "#!/bin/bash" > setup.sh
while read line
do
  name=`echo $line | cut -d' ' -f1` >> setup.sh
  kind=`echo $line | cut -d' ' -f2` >> setup.sh
  file=`echo $line | cut -d' ' -f3` >> setup.sh
  echo "echo 'Creating $kind $name'"
  echo "kubectl create -f $file"
done < ./elements.list

zip application.zip ./
base64 application.zip > application.zip.b64