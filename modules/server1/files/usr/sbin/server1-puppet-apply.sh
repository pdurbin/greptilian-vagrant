#!/bin/sh
puppet apply --modulepath=/home/pdurbin/grinfra/puppet/modules -e "include server1"
