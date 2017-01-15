#!/usr/local/bin/perl
use utf8;
use warnings;

print "Enter first number: ";
$x = <STDIN>;
chomp $x;

print "Enter second number: ";
$y = <STDIN>;
chomp $y;

$z = $x * $y;

print "The product of $x and $y is $z\n";
