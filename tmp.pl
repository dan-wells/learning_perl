#!/usr/local/bin/perl
use utf8;
use strict;

# unless = if not
# unless ($month eq "february") {
#     print "this month has at least 30 days\n";
# }
# can have an else clause too (so for if $month does eq feb)

# until = opposite of while
my $i = 1;
my $j = 9;
until ($i > $j) {
    $i *= 2;
    print "$i\n";
    # ends when $i = 16
}


# can use statement modifiers instead of control blocks:
#   print "$n is a negative number.\n" if $n < 0;
#   &error("Invalid input") unless &valid($input); - execute error sub if input not found valid
#   $i *= 2 until $i > $j;
my $n = 1;
print " ", ($n += 2) while $n < 10; # prints ` 3 5 6 7 9` -> print space, increment $n then print new value
#   &greet($_) foreach @person; - can only use $_ control variable using this syntax


# naked block p.180
