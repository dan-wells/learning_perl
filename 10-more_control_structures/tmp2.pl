#!/usr/local/bin/perl
use strict;

my($total, $valid, %count);
while (<>) {
    foreach (split) { # splits $_ lines from <> on whitespace, puts into $_ for inner loop
        $total++;
        next if /\W/; # next if match any non-alphanum/underscore
        $valid++;  # if no match then we can continue
        $count{$_}++; # get counts for individual words as well
    }
}
print "total things = $total, valid words = $valid\n";
foreach my $word (sort keys %count) {
    print "$word was seen $count{$word} times.\n";
}

