#!/bin/bash
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


copy()
{
    echo "Handling files"
    BASENAME=`basename "$1"`
    chmod -R 775 $SAB_COMPLETE_DIR
    chown -R 1000:media $SAB_COMPLETE_DIR
    #mv * /media/Movies
    echo "Copying files to movies folder"

    echo "Coyping from $SAB_COMPLETE_DIR to /media/Tv-Shows/$SAB_COMPLETE_DIR"

    cp -vnr $SAB_COMPLETE_DIR /media/Tv-Shows/$SAB_COMPLETE_DIR
}

scan
copy
