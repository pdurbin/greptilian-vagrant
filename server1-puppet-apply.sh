#!/bin/sh
# cd /root && git clone https://github.com/pdurbin/greptilian-vagrant.git
puppet apply --modulepath=/root/greptilian-vagrant/modules -e "include server1"
