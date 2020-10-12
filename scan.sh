#!/bin/sh
scan()
{
  BASENAME=`basename "$1"`
    LOGFILE="$1-clamscan.log"
  # LOGFILE="/var/log/clamav/clamscan.log"
  #  LOGFILE="/usr/local/sabnzbd/logs/clamscan.log"

  /usr/local/bin/clamscan -i -l "$LOGFILE" -r "$SAB_COMPLETE_DIR"

  if [ $? -eq 1 ]; then
    cd "$1"/..
    mv "$BASENAME" "${SAB_COMPLETE_DIR}_INFECTED_"
    echo "Virus found! In file {$1} category ${5} ${SAB_COMPLETE_DIR}"
  else
    echo "All OK - no virus found. In file {$1} category ${5}"
  fi
}

