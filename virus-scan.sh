#!/bin/sh

BASENAME=`basename "$1"`
LOGFILE="$1/clamscan.log"

/usr/bin/clamscan -i -l "$LOGFILE" -r "$1"

if [ $? -eq 1 ]; then
  cd "$1"/..
  mv "$BASENAME" _INFECTED_"$BASENAME"
  echo "Virus found!"
else
  echo "All OK - no virus found."
fi