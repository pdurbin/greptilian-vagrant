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
apt-get -y install git apache2 mysql-server ikiwiki libconfig-file-perl libregexp-common-perl libcache-cache-perl libdate-simple-perl libfile-slurp-perl libcalendar-simple-perl libbot-basicbot-perl libdbd-mysql-perl libtext-table-perl
/etc/init.d/mysql start
# setup mysql
mysqladmin -u root password root
#DATABASE = moritz5 
#USER = moritz
#PASSWORD = foo
mysql -u root -proot -e 'create database moritz5;'
mysql -u root -proot -e "grant all privileges on moritz5.* to 'moritz'@'localhost' identified by 'foo';"
mysql -u root -proot -e "grant lock tables,select,reload on *.* to 'mysqldump'@'localhost' identified by 'foo';"
mysql -u root -proot -e 'flush privileges;'
# just the irclog database or else mysql won't restart after boot
#LATEST_MYSQL_BACKUP=mysql_backup_20181019-230501.sql
LATEST_MYSQL_BACKUP=mysql_backup_irclog_20181020-202239.sql
wget http://data.greptilian.com/mysql/${LATEST_MYSQL_BACKUP}.bz2
bunzip2 ${LATEST_MYSQL_BACKUP}.bz2
cat $LATEST_MYSQL_BACKUP | mysql -u root -proot moritz5

cd /var/www
git clone https://github.com/pdurbin/philbot.git irclog.greptilian.com
#chown pdurbin:pdurbin /var/www/irclog.greptilian.com
cd /var/www/irclog.greptilian.com
cp -a bot.conf bot.conf.orig
cp /greptilian/files/var/www/irclog.greptilian.com/bot.conf .
# configure bot for testing
# cp /greptilian/bot.conf /var/www/irclog.greptilian.com/philbot/bot.conf
# ./ilbot2.pl # quick test
mkdir /usr/local/lib/site_perl
mkdir /usr/local/lib/site_perl/IrcLog
cp /var/www/irclog.greptilian.com/lib/IrcLog.pm /usr/local/lib/site_perl/IrcLog.pm
cp /var/www/irclog.greptilian.com/lib/IrcLog/WWW.pm /usr/local/lib/site_perl/IrcLog/WWW.pm
cp /var/www/irclog.greptilian.com/database.conf /var/www/irclog.greptilian.com/cgi/database.conf

a2enmod cgi
a2enmod rewrite
a2enmod headers
# cp -a /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf.`date +'%s'`
# cp /greptilian/irclog.greptilian.com.conf /etc/apache2/sites-available/000-default.conf
service apache2 restart

apt-get -y install munin
mkdir /var/www/munin.greptilian.com
chown munin:munin /var/www/munin.greptilian.com
cp -a /etc/munin/munin.conf /etc/munin/munin.conf.`date +'%s'`
cp /greptilian/files/etc/munin/munin.conf /etc/munin/munin.conf
/etc/init.d/munin-node restart

# configure gitweb
cp /greptilian/files/etc/gitweb.conf /etc

#./index.pl
touch $HAS_BEEN_SETUP
