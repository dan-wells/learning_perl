#!/usr/local/bin/perl
use strict;

my %surnames = (
    fred => 'flinststone',
    barney => 'rubble',
    betty => 'rubble',
);

print "What's your first name? ";
chomp (my $name = <STDIN>);

if (exists $surnames{$name}) {
    print "Your surname is $surnames{$name}.\n";
} else {
    print "Sorry, we don't know your surname.\n";
}
