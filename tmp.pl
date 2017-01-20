#!/usr/local/bin/perl
use utf8;
use strict;

my @files = glob("5-io/*");
foreach (@files) {
    print "One file is $_\n";
}

my $dir = "5-io";
opendir my $dh, $dir or die "Can't open directory $dir: $!";
foreach my $file (readdir $dh) {
    print "One file is $file\n";
}
closedir $dh;

# manipulating files p.229
