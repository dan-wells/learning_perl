#!/usr/local/bin/perl
use strict;
# !perl 10-more_control_structures/tmp3.pl 10-more_control_structures/tmp3-1.txt 10-more_control_structures/tmp3-2.txt

my @lines;
LINE: while (<>) {
    WORD: foreach (split) {
        last LINE if /__END__/; # bail out of outer LINE loop
        last WORD if /EOL/;     # skip the rest of the line
        push(@lines, uc($_)." ");   # just uppercase input for fun
    }
    push(@lines, "\n");
}
print @lines; 
