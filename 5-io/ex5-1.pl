#!/usr/local/bin/perl
use strict;

## my @lines;
## while ( <> ) {
##     push @lines, $_;
## }
## # spit out in reverse
## while ( @lines ) {
##     my $out = pop @lines;
##     print $out;
## }

print reverse <>;
# <> reads into a list, then reversed and printed
