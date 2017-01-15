#!/usr/local/bin/perl
use utf8;
use strict;
use v5.10;

sub sum_of_a_and_b {
    print "you summed a and b!\n";
    $a + $b;
}

$a = 2;
$b = 3;

my $c = &sum_of_a_and_b;
print "and the answer is $c!\n";


sub larger_of_a_or_b {
    if ($a > $b) {
        $a;
    } else {
        $b;
    }
}

my $d = &larger_of_a_or_b;
print "$d\n";


# by default all variables in perl are global
# private variables (scoped within a block) can be declared using my
# nb. `my $a, $b = @_;` is scalar context and will ONLY declare $a
#     `my($a, $b) = @_;` is array context and will declare both

# sub max {
#     # if (@_ != 2) {
#     #     print "WARNING! &max should get exactly two arguments!\n";
#     # }
#     # my($m, $n);
#     # ($m, $n) = @_; # @_ contains the list of sub arguments
#     # or just do this in one line
#     my($m, $n) = @_;
#     if ($m > $n) { $m } else { $n };
# }

sub max {
    my $max_so_far = shift @_; # set first input value to current max
    foreach (@_) {
        if ($_ > $max_so_far) {
            $max_so_far = $_;
        }
    }
    $max_so_far;
}

my @numbers = (3, 5, 10, 4, 6);
my $big = max(@numbers);
print "The biggest is $big\n";


# the return operator returns a value from a sub immediately
my @names = qw/ fred barney betty dino wilma pebbles bamm-bamm /;
my $result = &which_element_is("dino", @names);
print "dino is number $result\n";

sub which_element_is {
    my($what, @array) = @_; 
    foreach (0..$#array) {
        if ($what eq $array[$_]) {
            return $_;
        }
    }
    -1; # return this if no match found
}


# the value of private variables in subs can be preserved between invocations using state
# nb. needs `use v5.10` to use
sub running_sum {
    state $sum = 0;
    state @numbers;
    foreach my $number ( @_ ) {
        push @numbers, $number;
        $sum += $number;
    }
    print "The sum of (@numbers) is $sum\n";
}
&running_sum( 5, 6 );
&running_sum( 1..3 );
&running_sum( 4 );
