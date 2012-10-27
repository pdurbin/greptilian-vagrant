#!/bin/sh
# cd /root && git clone https://github.com/pdurbin/greptilian-vagrant.git
puppet apply --modulepath=/root/greptilian-vagrant/modules /root/greptilian-vagrant/manifests/init.pp
