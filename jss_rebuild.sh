#!/bin/bash
unzip -qq -o -d /tmp/JSS ~/Downloads/JSSInstallation/JSS\ Components/ROOT.war

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

OLD2="jamfsw03"
NEW2="YOUR_PASSWORD"
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
/bin/rm $TFILE2

OLD3="localhost"
NEW3="YOUR_DB_SERVER"
DPATH3="/tmp/JSS/WEB-INF/xml/DataBase.xml"
BPATH3="/tmp"
TFILE3="/tmp/out.tmp.$$"
[ ! -d $BPATH3 ] && mkdir -p $BPATH3 || :
for f in $DPATH3
do
  if [ -f $f -a -r $f ]; then
    /bin/cp -f $f $BPATH3
   sed "s/$OLD3/$NEW3/g" "$f" > $TFILE3 && mv $TFILE3 "$f"
  else
   echo "Error: Cannot read $f"
  fi
done
