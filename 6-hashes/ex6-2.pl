#!/usr/local/bin/perl
use strict;

# can have one line to declare all your variables if you like
# -> don't need my for all your array iterator variables
# my(@words, %word_counts, $word, $i);

print "Enter words to count on individual lines:\n";
chomp( my @words = <STDIN>);

my %word_counts;
foreach my $word (@words) {
    $word_counts{$word} += 1;
}

foreach my $i (sort keys %word_counts) {
    print "We saw the word '$i' $word_counts{$i} times.\n";
}
