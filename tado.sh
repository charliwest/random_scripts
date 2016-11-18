#!/bin/bash
USERNAME=your@email.com
PASSWORD=yourPassword
curl --silent "https://my.tado.com/j_spring_security_check?j_password=$PASSWORD&j_username=$USERNAME" --data-binary "{}" --cookie-jar /tmp/tadocookies
curl --silent "https://my.tado.com/api/v1/me" -H "Referer: https://my.tado.com/" --cookie /tmp/tadocookies > homeId
HOMEID=$(grep -o "homeId.*," homeId| awk -F, '{print $1}'|awk -F\: '{print $2}')
curl --silent "https://my.tado.com/api/v1/home/$HOMEID/hvacState" -H "Referer: https://my.tado.com/" --cookie /tmp/tadocookies > temp
TEMP=$(grep -o "celsius.*," temp| awk -F, '{print $1}'|awk -F\: '{print $2}')
echo "$TEMP"
