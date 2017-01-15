#!/usr/local/bin/perl
use utf8;

# perl ex3-1.pl < ex3-1.txt
# @lines = <STDIN>;

# @reversed = reverse @lines;
# # print "@reversed\n"; # just printing here adds ' ' to each line past the first
# foreach (@reversed) {
#     print "$_";
# }

# if you don't need to keep the input, can just do this
print reverse <STDIN>;
