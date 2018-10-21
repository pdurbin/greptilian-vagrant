#!/bin/sh
# tested on 14.04.2 in Vagrant
HAS_BEEN_SETUP='/root/.greptilian-setup-done'
if [ -f $HAS_BEEN_SETUP ]; then
    echo "setup done already, exiting"
    exit 1
fi
echo "doing setup"
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -y install git apache2 mysql-server ikiwiki supybot libconfig-file-perl libregexp-common-perl libcache-cache-perl libdate-simple-perl libfile-slurp-perl libcalendar-simple-perl libbot-basicbot-perl libdbd-mysql-perl
/etc/init.d/mysql start
# setup mysql
mysqladmin -u root password root
#DATABASE = moritz5 
#USER = moritz
#PASSWORD = foo
mysql -u root -proot -e 'create database moritz5;'
mysql -u root -proot -e "grant all privileges on moritz5.* to 'moritz'@'localhost' identified by 'foo';"
mysql -u root -proot -e 'flush privileges;'
# just the irclog database or else mysql won't restart after boot
#LATEST_MYSQL_BACKUP=mysql_backup_20181019-230501.sql
LATEST_MYSQL_BACKUP=mysql_backup_irclog_20181020-202239.sql
wget http://data.greptilian.com/mysql/${LATEST_MYSQL_BACKUP}.bz2
bunzip2 ${LATEST_MYSQL_BACKUP}.bz2
cat $LATEST_MYSQL_BACKUP | mysql -u root -proot moritz5

mkdir /var/www/irclog.greptilian.com
cd /var/www/irclog.greptilian.com
git clone https://github.com/pdurbin/philbot.git
cd philbot
cp -a bot.conf bot.conf.orig
cp /greptilian/files/var/www/irclog.greptilian.com/bot.conf .
# configure bot for testing
# cp /greptilian/bot.conf /var/www/irclog.greptilian.com/philbot/bot.conf
# ./ilbot2.pl # quick test
mkdir /usr/local/lib/site_perl
mkdir /usr/local/lib/site_perl/IrcLog
cp /var/www/irclog.greptilian.com/philbot/lib/IrcLog.pm /usr/local/lib/site_perl/IrcLog.pm
cp /var/www/irclog.greptilian.com/philbot/lib/IrcLog/WWW.pm /usr/local/lib/site_perl/IrcLog/WWW.pm
# use /var/www/irclog.greptilian.com/philbot/database.conf in /usr/local/lib/site_perl/IrcLog.pm
cp /var/www/irclog.greptilian.com/philbot/database.conf /var/www/irclog.greptilian.com/philbot/cgi/database.conf
# /var/www/irclog.greptilian.com/cgi vs. /var/www/irclog.greptilian.com/philbot/cgi
a2enmod cgi
a2enmod rewrite
# cp -a /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf.`date +'%s'`
# cp /greptilian/irclog.greptilian.com.conf /etc/apache2/sites-available/000-default.conf
service apache2 restart

#./index.pl
touch $HAS_BEEN_SETUP
