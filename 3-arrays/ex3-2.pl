#!/usr/local/bin/perl
use utf8;

@people = qw( fred betty barney dino wilma pebbles bamm-bamm );

print "Select which people to print:\n";
chomp(@indices = <STDIN>);

foreach $n (@indices) {
    $i = $n - 1; # map from people numbers to array indices
    print "$people[$i]\n";
}
