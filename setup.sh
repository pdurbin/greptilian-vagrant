#!/bin/sh
HAS_BEEN_SETUP='/root/.greptilian-setup-done'
if [ -f $HAS_BEEN_SETUP ]; then
    echo "setup done already, exiting"
    exit 1
fi
echo "doing setup"
export DEBIAN_FRONTEND=noninteractive
# 512 MB is too memory constainted: http://askubuntu.com/questions/457923/why-did-installation-of-mysql-5-6-on-ubuntu-14-04-fail
fallocate -l 4G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
apt-get -y install mysql-server-5.6
/etc/init.d/mysql start
# setup mysql
mysqladmin -u root password root
#DATABASE = moritz5 
#USER = moritz
#PASSWORD = foo
mysql -u root -proot -e 'create database moritz5;'
mysql -u root -proot -e "grant all privileges on moritz5.* to 'moritz'@'localhost' identified by 'foo';"
mysql -u root -proot -e 'flush privileges;'
wget http://data.greptilian.com/mysql/ mysql_backup_20141017-230501.sql.bz2
bunzip mysql_backup_20141017-230501.sql.bz2
cat mysql_backup_20141017-230501.sql | mysql -u root -proot moritz5

# FIXME: "swapoff failed: Cannot allocate memory" how to avoid rebooting to remove /swapfile?
#echo "3" > /proc/sys/vm/drop_caches
#swapoff /swapfile
echo "time to reboot"
exit
rm -rf /swapfile
apt-get -y install apache2
apt-get -y install git
# ilbot 96203e28fd2439e54e37f06387ce17c447f8a1ff
cd /var/www
git clone https://github.com/moritz/ilbot.git
cd ilbot
git checkout 96203e28fd2439e54e37f06387ce17c447f8a1ff
cp -a bot.conf bot.conf.orig
cp /greptilian/bot.conf .
apt-get -y install libconfig-file-perl libbot-basicbot-perl libdbd-mysql-perl libcache-cache-perl
# ./ilbot2.pl # quick test
# apt-cache search 'perl$'
cd cgi
cp -r ../lib .
apt-get -y install libregexp-common-perl libhtml-parser-perl libcalendar-simple-perl libfile-slurp-perl libdate-simple-perl libtext-table-perl
cp ../database.conf .
./index.pl
#
# "version" works fine
apt-get install supybot
# ikiwiki version 3.20130904.1ubuntu1
apt-get install ikiwiki
touch $HAS_BEEN_SETUP
