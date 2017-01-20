#!/usr/local/bin/perl
use strict;

my $target = int(1 + rand 100); # rand 100 gives float between 0-99.9+; int truncates

print "Guess a number from 1-100, or type 'quit' to exit.\n";
while (1) {             # infinite loop to keep guessing until we win
    chomp(my $guess = <STDIN>);
    if ($guess =~ /\b(quit|exit)\b/i) {
        print "Okay, better luck next time.\n";
        last;
    } elsif ($guess == $target) {
        print "Congratulations! You got it.\n";
        last;
    } elsif ($guess < $target) {
        print "Too low...\n";
    } elsif ($guess > $target) {
        print "Too high...\n";
    }
}
