#!/bin/sh
TEST_DATA='2:#pdurbin,3:#pdurbin1'
cd /var/www/unread.greptilian.com
#echo $TEST_DATA | ./go2.sh
cat - | ./go2.sh
