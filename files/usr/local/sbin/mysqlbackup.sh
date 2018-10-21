#!/bin/sh
#
# MySQL Backup Script
#  Dumps mysql databases to a file for another backup tool to pick up.
#
# MySQL code:
# GRANT SELECT, RELOAD, LOCK TABLES ON *.* TO 'user'@'localhost'
# IDENTIFIED BY 'password';
# FLUSH PRIVILEGES;
#
##### START CONFIG ###################################################

USER=mysqldump
PASS=foo
DIR=/var/www/data/mysql

##### STOP CONFIG ####################################################
PATH=/usr/bin:/usr/sbin:/bin:/sbin

find $DIR -mtime +30 -exec rm -f {} \;
mysqldump -u${USER} -p${PASS} --opt --flush-logs --single-transaction \
 --all-databases | bzcat -zc > ${DIR}/mysql_backup_`date +%Y%m%d-%H%M%S`.sql.bz2

mysqldump -u${USER} -p${PASS} --opt --flush-logs --single-transaction \
 moritz5 | bzcat -zc > ${DIR}/mysql_backup_irclog_`date +%Y%m%d-%H%M%S`.sql.bz2
