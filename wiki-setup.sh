#!/bin/sh
git clone --bare https://github.com/pdurbin/wiki.git /var/lib/git/wiki.git
chown -R pdurbin:pdurbin /var/lib/git/wiki.git
mkdir /srv/wiki-srcdir
chown pdurbin:pdurbin /srv/wiki-srcdir
cd /srv/wiki-srcdir
git init
git remote add origin /var/lib/git/wiki.git
git config branch.master.merge refs/heads/master
git config branch.master.remote origin
git clone /var/lib/git/wiki.git /tmp/wiki
mkdir /var/www/wiki
chown pdurbin:pdurbin /var/www/wiki
ikiwiki --setup /tmp/wiki/wiki.setup
rm -rf /tmp/wiki
