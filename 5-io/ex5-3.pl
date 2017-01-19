#!/usr/local/bin/perl
use strict;

print "Enter strings to be printed on separate lines:\n";
chomp ( my @strings = <STDIN> );

print "Enter right-justify offset: ";
chomp ( my $offset = <STDIN> );

my $rule = "1234567890";
my $rule_length = ($offset + 9) / 10; # always round up to next-largest multiple of 10 on ruler
print $rule x $rule_length, "\n";

foreach (@strings) {
    printf "%${offset}s\n", $_;
}
