#!/usr/local/bin/perl
use strict;

print "Enter strings to be printed on separate lines:\n";
chomp ( my @strings = <STDIN> );

my $rule = "1234567890";
print $rule x 4, "\n";
foreach (@strings) {
    printf "%20s\n", $_;
}
