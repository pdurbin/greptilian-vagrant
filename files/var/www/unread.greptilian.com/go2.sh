#!/bin/sh
#echo $1
INPUT=`cat -`
echo $INPUT > /var/www/unread.greptilian.com/debug.txt
echo $INPUT | tr , "\n" | sort -n > /var/www/unread.greptilian.com/activity.txt && true && cd /var/www/unread.greptilian.com && ./go.pl > activity2.txt && cat activity_begin activity2.txt activity_end > activity.html
