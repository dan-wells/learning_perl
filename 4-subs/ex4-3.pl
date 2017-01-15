#!/usr/local/bin/perl
use utf8;
use strict;
use warnings;

my @fred = &above_average(1..10);
print "\@fred is @fred\n";
print "(Should be 6 7 8 9 10)\n";
my @barney = &above_average(100, 1..10);
print "\@barney is @barney\n";
print "(Should be just 100)\n";

sub above_average {
    my @big;
    my $avg = &average( @_ );
    # print "AVERAGE = $avg\n";
    foreach ( @_ ) {
        if ($_ > $avg) {
            push @big, $_;
        }
    }
    @big;
}

sub average {
    if (@_ == 0) { return } # exclude empty argument lists
    my $sum;
    my $len = @_;
    foreach ( @_ ) {
        $sum += $_;
    }
    $sum / $len;
}
