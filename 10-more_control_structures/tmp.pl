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
# my $n = 1;
# print " ", ($n += 2) while $n < 10; # prints ` 3 5 6 7 9` -> print space, increment $n then print new value
#   &greet($_) foreach @person; - can only use $_ control variable using this syntax


# a naked block has no keyword or condition, and provides a limited scope for any short-use named variables
# {
#     print "Please enter a number: ";
#     chomp( my $n = <STDIN> );
#     my $root = sqrt $n;
#     print "The square root of $n is $root.\n";
# }
# print $n; # then this raises an error with strict


# autoincrement ++ adds 1 to variable (-- substracts)
# and initialises variables if required, e.g.
my @people = qw( fred barney fred wilma dino barney fred pebbles );
my %count;
$count{$_}++ foreach @people; # increments count for each name as encountered in array
while ( (my $key, my $value) = each %count ) {
    print "$key => $value\n";
}

# can fetch values and increment at the same time
my $m = 5;
my $n = ++$m; # returns 6: increment then get new value
print "n: $n, m: $m\n";
my $a = $m++; # returns 6, then increments $m to 7
print "a: $a, m: $m\n";

# useful for checking pre-existence of something in a hash
my @people = qw( fred barney fred wilma dino barney betty pebbles );
my %seen;
foreach (@people) {
    print "I've seen you somewhere before, $_!\n" if $seen{$_}++;
}
# first time you see fred in @people, $seen{fred} is false, so don't print
# increment => $seen{fred} = 1 next time round, so print


# for control structure looks like:
#     for (initialisation; test; increment) {
#         body;
#     }
# and is read by perl as:
#     initialisation;
#     while (test) {
#         body;
#         increment;
#     }

for (my $i = 1; $i <= 10; $i++) { # count from 1-10 (== foreach my $i (1..10) { )
    print "I can count to $i!\n";
}

# for (my $i = 10; $i >= 1; $i--) {} # count down from 10-1
# for (my $i = -150; $i <= 1000; $i += 3) {} # count from -150 up to 1000 in multiples of 3

# any of the three control parts can be left blank, e.g.
for ($_ = "bedrock"; s/(.)//; ) { # loops while the s/// is successful (returns 1 if sub completed)
    print "One character is: $1\n"; # $1 contains match group
}
# this initialises loop input to string, matches and deletes one character at a time
# no increment required, subbed string is used as next input


# loop controls
# # last immediately ends inner loop (python break)
# while (<STDIN>) {
#     if (/__END__/) {
#         last;
#     } elsif (/fred/) {
#         print;
#     }
# } # prints all lines matching fred until __END__ found (even if lines further down match fred)

# # next moves to next iteration of inner loop (python continue)
# while (<>) {
#     foreach (split) { # splits $_ lines from <> on whitespace, puts into $_ for inner loop
#         my $total++;
#         next if /\W/; # next if match any non-alphanum/underscore
#         my $valid++;  # if no match then we can continue
#         my $count{$_}++; # get counts for individual words as well
#     }
# }
# print "total things = $total, valid words = $valid\n";
# foreach my $word (sort keys %count) {
#     print "$word was seen $count{$word} times.\n";
# }

# # redo goes back to top of inner loop without checking any condition again
# my @words = qw( fred barney pebbles dino wilma betty ); # set up a typing test
# my $errors = 0;
# foreach (@words) {
#     print "type the word '$_': ";
#     chomp(my $try = <STDIN>);
#     if ($try ne $_) {
#         print "Sorry - That's not right.\n\n";
#         $errors++;
#         redo;
#     }
# }
# print "You've completed the test with $errors errors.\n";


# # labeled blocks allow control words to apply to outer blocks, not just current inner loop
# LINE: while (<>) {
#     WORD: foreach (split) {
#         last LINE if /__END__/; # bail out of outer LINE loop
#         last WORD if /EOL/;     # skip the rest of the line
#         ...
#     }
# }


# conditional operator like you've seen in ecma
# expression ? if_true_expr : if_fals_expr;

# can nest these
my $size = 
    ($width < 10) ? "small" :
    ($width < 20) ? "medium" :
    ($width < 50) ? "large" :
        "extra-large"; #default
