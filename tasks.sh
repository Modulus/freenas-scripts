#!/bin/bash

# These are jobs in tasks  paste on and one as tasks
iocage exec clamav clamscan -i -l /var/log/clamav/clamscan.log -r /media


# Update clamscan in clamav plugin
iocage exec sabnzbd-client freshclam 

#Alt
iocage exec sabnzbd-client freshclam && iocage exec clamav clamscan -i -l /var/log/clamav/clamscan.log -r /media

# Update clamscan in sabnzbd client
iocage exec sabnzbd-client freshclam

