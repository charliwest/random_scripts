#!/bin/bash
unzip -qq -o -d /tmp/ ~/Downloads/JSSInstallation*.zip
unzip -qq -o -d /tmp/JSS ~/tmp/JSSInstallation/JSS\ Components/ROOT.war
#Set a more linux friendly logging location
OLD="Library\/JSS\/Logs"
NEW="var\/log\/JSS"
DPATH="/tmp/JSS/WEB-INF/classes/log4j.properties"
BPATH="/tmp"
TFILE="/tmp/out.tmp.$$"
[ ! -d $BPATH ] && mkdir -p $BPATH || :
for f in $DPATH
do
  if [ -f $f -a -r $f ]; then
    /bin/cp -f $f $BPATH
   sed "s/$OLD/$NEW/g" "$f" > $TFILE && mv $TFILE "$f"
  else
   echo "Error: Cannot read $f"
  fi
done
/bin/rm $TFILE

#Replace the password for db access
OLD2="jamfsw03"
NEW2="NewPassword"
DPATH2="/tmp/JSS/WEB-INF/xml/DataBase.xml"
BPATH2="/tmp"
TFILE2="/tmp/out.tmp.$$"
[ ! -d $BPATH2 ] && mkdir -p $BPATH2 || :
for f in $DPATH2
do
  if [ -f $f -a -r $f ]; then
    /bin/cp -f $f $BPATH2
   sed "s/$OLD2/$NEW2/g" "$f" > $TFILE2 && mv $TFILE2 "$f"
  else
   echo "Error: Cannot read $f"
  fi
done
echo 'Files edited'
cd /tmp/JSS ;
echo 'Building WAR file'
zip -r -qq /tmp/ROOT.war *
echo 'Cleaning up'
/bin/rm -rf /tmp/JSS
/bin/rm $TFILE2
/bin/rm /tmp/log4j.properties /tmp/DataBase.xml
echo 'All done'
