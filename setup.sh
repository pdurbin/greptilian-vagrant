#!/bin/sh

apt-get -y install git apache2 ikiwiki

# still needed?
# apt-get -y install libconfig-file-perl libregexp-common-perl libcache-cache-perl libdate-simple-perl libfile-slurp-perl libcalendar-simple-perl libbot-basicbot-perl libdbd-mysql-perl

# configure gitweb
cp /tmp/greptilian/files/etc/gitweb.conf /etc

# needed for gitweb
a2enmod cgi
service apache2 restart

# still needed?
#a2enmod rewrite
#a2enmod headers
# cp -a /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf.`date +'%s'`
# cp /tmp/greptilian/irclog.greptilian.com.conf /etc/apache2/sites-available/000-default.conf

apt-get -y install munin
mkdir /var/www/munin.greptilian.com
chown munin:munin /var/www/munin.greptilian.com
cp -a /etc/munin/munin.conf /etc/munin/munin.conf.`date +'%s'`
cp /tmp/greptilian/files/etc/munin/munin.conf /etc/munin/munin.conf
/etc/init.d/munin-node restart
