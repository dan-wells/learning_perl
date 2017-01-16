#!/usr/local/bin/perl
use utf8;
use strict;

# reading from <STDIN> in scalar context takes the next line only
# or only accepts one line from terminal, no ctrl-d required
# print "Give us a line: ";
# my $line;
# chomp($line = <STDIN>);
# print "You said \"$line\"!\n";


# to read all lines until the end of a file, just do
# while (<STDIN>) {
# 	print "I saw $_";
# }


# evaluating line input in a list context loads all lines into an array before executing following block
# -> so can be expensive
# this will wait for a ctrl-d before printing anything
# foreach (<STDIN>) {
# 	print "I saw $_";
# }


# the diamond operator <> will read input serially from command line options
# e.g. `./my_script one two three` reads input from files one two three as if they were concatenated
# can also read from stdin (`-` on command line) or a pipe
# while (<>) {
# 	chomp; # chomp works on $_ with no other arguments
# 	print "It was $_ in file $ARGV that I saw!\n"; # $ARGV contains current argument (=filename here)
# }

# could parse contents of @ARGV to look for e.g. args beginning - => option flags
# good for simple things but otherwise should use Getopt module

# can also populate @ARGV explicitly and read from that using <>
@ARGV = qw( file1.txt file2.txt file3.txt );


# nb. difference between printing and interpolating arrays
print @ARGV; # concatenates items with no spaces
print "@ARGV"; # interpolated result inserts spaces between items

# p.89 formatted output with printf
