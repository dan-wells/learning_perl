#!/usr/local/bin/perl
use utf8;

chomp($r = <STDIN>);
$pi = 3.14159;

$circ = 2 * $pi * $r;
print "The circumference of a circle with radius $r is $circ\n";
