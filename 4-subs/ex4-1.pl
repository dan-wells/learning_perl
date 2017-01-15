#!/usr/local/bin/perl
use utf8;
use strict;
use warnings;

my @fred = qw( 1 3 5 7 9 );
my $fred_total = total(@fred);
print "The total of \@fred is $fred_total.\n";
print "Enter some numbers on separate lines: ";
my $user_total = total(<STDIN>);
print "The total of those numbers is $user_total.\n";

# sub total {
#     my @numbers = @_;
#     my $sum = 0;
#     foreach my $num ( @numbers ) {
#         $sum += $num;
#     }
#     return $sum;
# }

sub total {
    # my $sum; # an empty parameter list will return undef
    my $sum = 0;
    foreach ( @_ ) {
        $sum += $_;
    }
    return $sum;
}
