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
#   print "I saw $_";
# }


# evaluating line input in a list context loads all lines into an array before executing following block
# -> so can be expensive
# this will wait for a ctrl-d before printing anything
# foreach (<STDIN>) {
#   print "I saw $_";
# }


# the diamond operator <> will read input serially from command line options
# e.g. `./my_script one two three` reads input from files one two three as if they were concatenated
# can also read from stdin (`-` on command line) or a pipe
# while (<>) {
#   chomp; # chomp works on $_ with no other arguments
#   print "It was $_ in file $ARGV that I saw!\n"; # $ARGV contains current argument (=filename here)
# }

# could parse contents of @ARGV to look for e.g. args beginning - => option flags
# good for simple things but otherwise should use Getopt module

# can also populate @ARGV explicitly and read from that using <>
# @ARGV = qw( file1.txt file2.txt file3.txt );


# nb. difference between printing and interpolating arrays
# print @ARGV; # concatenates items with no spaces
# print "@ARGV"; # interpolated result inserts spaces between items

# p.89 formatted output with printf
# %s = string
# %d = decimal integer (truncated, not rounded)
# %f = float
# %g = smart number, picks float, int or exp notation as appropriate
## printf "%g %g %g\n", 5/2, 51/17, 51 ** 17; # prints 2.5 3 1.0683e+29
## 
## # numbers preceding conversion format set field width
## # output gets padded with spaces up to width
## printf "%6d%6d\n", 1, 2;
## # negative numbers left-justify
## printf "%-6d%-6d\n", 1, 2;
## # adding 0 uses that to right-justify
## printf "%06d %06d\n", 1, 2;
## 
## # %f also gives the option to specify dp to round to
## printf "%12f\n", 6 * 7 + 2/3;   #   42.666667
## printf "%12.3f\n", 6 * 7 + 2/3; #      42.667
## printf "%12.0f\n", 6 * 7 + 2/3; #          43
## printf "%.2f\n", 6 * 7 + 2/3;   #42.67
## 
## # to print a literal % use %%, not \%
## 
## # can explicitly pick items to print by index using i$
## # nb. need to use single quotes otherwise tries to find variable $d !!!
## printf '%2$d %1$d %2$d'."\n", 1, 2;
## 
## 
## # can print to a file other than STDOUT 
## # printf HANDLE $format, @values;
## # sprintf returns the string that printf would have printed
## # $foo = sprintf "%d", 3.14;    # get truncated value
## # $bar = sprintf "%.1f", 3.14;  # get rounded value
## 
## # can format all items in an arbitray-length list by concatenating a format pattern dynamically
## my @items = qw( one two three four five );
## printf "The items are:\n".("%10s\n" x @items), @items;
# x forces scalar context on @items, gets length and repeats string that many times    


# opening filehandles
# open CONFIG, '<', 'dino'; # opens file dino for reading into filehandle CONFIG
# open BEDROCK, '>', $file_name; # opens $file_name for writing (and clears it first) into filehandle BEDROCK
# open LOG, '>>', $logfile; # appends to $logfile via handle LOG

# can set encodings
# open FILE, '>:encoding(UTF-8)', $file;

# output DOS-style line endings, or convert DOS to \r\n to \n only on input
# open FILE, '>:crlf', $file; # crlf = carriage return/linefeed

# closing filehandles
# close FILE; # easy

# use die to generate fatal error messages (or warn for warnings which won't terminate program)
# open TMP, '<', 'readfile.txt' or die "Cannot read file: $!"; # $! contains last system error message and line number in script
# open TMP, '<', 'readfile.txt' or die "Cannot read file\n"; # trailing newline in error message suppresses script name/line number
# useful for usage errors, which don't really need that information


# examples writing to file (all the same)
# printf FILE "%d%% complete\n", $done/$total * 100;
# printf (FILE "%d%% complete\n", $done/$total * 100);
# printf FILE ("%d%% complete\n", $done/$total * 100);

# filehandles can also be created in a scalar variable, which makes them simpler to store in arrays/hashes, pass as sub args etc.
# open(my $file, '<', 'tmp.txt') or die "Can't open file: $!";
# while ( <$file> ) {
#     ...
# }
open(my $file, '>', '5-io/tmp.txt') or die "Can't open file: $!";
print $file "testing\n";
