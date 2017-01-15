#!/usr/local/bin/perl
use utf8;
use warnings;

print "Enter word to repeat: ";
$x = <STDIN>;
chomp $x;

print "Enter number of repetitions: ";
$y = <STDIN>;
chomp $y;

$z = $x x $y;

print "You wanted to say: $z\n";
