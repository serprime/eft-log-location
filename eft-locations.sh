#!/bin/bash
#
# SETUP: provide ~/.eft-location config file to define below properties:
#
# LOGS points to the root directory where logs are saved from Escape from Tarkov game.
# LOGS='/c/Battlestate Games/escapefromtarkov/Logs'
#
# Api key of ipstack.com, get your own for free with limited usage quota.
# API_KEY='12345678901234567890'
. ~/.eft-locations
export API_KEY

# find latest log file
LATEST=`ls -t "$LOGS" | head -1`
APPLICATION_LOG=`ls "$LOGS/$LATEST" | grep application | head -1`
LOG="$LOGS/$LATEST/$APPLICATION_LOG"
echo "using latest log file: $LOG"

function printLocation {
  IP=$0
  JSON=`curl -s "http://api.ipstack.com/$IP?access_key=$API_KEY&format=1"`
  COUNTRY=$(echo $JSON | sed -n 's/.*"country_name":"\([^"]*\)".*/\1/p')
  echo $IP $COUNTRY
}
export -f printLocation

# tail application log and print locations fetched from ipstack api:
tail -n1000 -f "$LOG" | grep --line-buffered 'NetworkGameCreate profileStatus' | sed -u 's/.*Ip:\ \([^,]*\).*/\1/' | xargs -n1 bash -c 'printLocation "$@"'
