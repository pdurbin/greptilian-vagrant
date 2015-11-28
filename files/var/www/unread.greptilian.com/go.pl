#!/usr/bin/perl
use strict;
use warnings;
use 5.010;
use Data::Dumper;

my $haunts_file = '/var/www/wiki/haunts/haunts.tsv';
my $activity_file = 'activity.txt';
open( my $activity_fh, "<", "$activity_file" ) or die "cannot open $activity_file: $!";
open( my $haunts_fh, "<", "$haunts_file" ) or die "cannot open $haunts_file: $!";

my $chans;
for my $line (<$haunts_fh>) {
    my ($servchan, $logs, $homepage ) = split(/\t/,$line);
    my ($server, $channel ) = split(/\//,$servchan);
    $$chans{$channel}{'logs'} = $logs;
}

for my $line (<$activity_fh>) {
    my ($buffer_num, $channel_name ) = split(/:/,$line);
    if ($channel_name) {
        chomp $channel_name;
        my $log = 'UNKNOWN';
        $log = $$chans{$channel_name}{'logs'} if $$chans{$channel_name};
        say "<a href='$log'>$channel_name</a>";
    }
}
