#!/usr/local/bin/perl
use strict;

my @env_vars = sort keys %ENV;
# get max var name length
my $max_len;
foreach my $var (@env_vars) {
    if (length $var > $max_len) {
        $max_len = length $var;
    }
# or can have if-condition in just one line:
# my $var_length = length( $var );
# $max_len = $var_length if $var_length > $max_len;
}

foreach my $key (@env_vars) {
    printf "%-${max_len}s => %s\n", $key, $ENV{$key};
}
