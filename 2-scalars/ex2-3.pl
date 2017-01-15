#!/usr/local/bin/perl
use utf8;

$pi = 3.14159;
chomp($r = <STDIN>);

if ($r < 0) {
    $circ = 0;
} else {
    $circ = 2 * $pi * $r;
}

print "The circumference of a circle with radius $r is $circ\n";
