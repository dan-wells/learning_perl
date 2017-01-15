#!/usr/local/bin/perl
use utf8;

print "Enter strings to sort:\n";
@strings = <STDIN>;

@sorted = sort @strings;

print "Would you like to print on ONE line or SEPARATE lines? ";
chomp($opt = <STDIN>);
if ($opt eq "one") {
    chomp @sorted;
    print "@sorted\n";
} else {
    foreach (@sorted) {
        print;
    }
}
