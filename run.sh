#!/bin/bash

#########################################
##  FILES, SERVICES AND CONFIGURATION  ##
#########################################
[ -z "$DS_UID" ] && DS_UID=1000
[ -z "$DS_GID" ] && DS_GID=1000

groupadd -r -g $DS_GID darkstat  && useradd --no-log-init -u $DS_UID -g darkstat darkstat

# Set permissions on database and log directory
mkdir -p /config
chown -R darkstat:darkstat /config
chmod 755 -R /config

# TODO Mieux gérer les options
/usr/local/sbin/darkstat --no-daemon --chroot /config/ --user darkstat $OPTIONS