#!/usr/local/bin/perl
use utf8;
use strict;

# syntax for retrieving elements:
#   $hash{$key}

# assignment and reference:
my %family_name;
$family_name{'fred'} = 'flintstone';
$family_name{'barney'} = 'rubble';

foreach my $person (qw/ barney fred /) {
    print "I've heard of $person $family_name{$person}.\n";
}

my $foo = 'bar';
print $family_name{ $foo.'ney'}, "\n";

# hashes act like defaultdicts, so this creates the new key and then 'appends' the value
$family_name{'betty'} .= $family_name{barney}; # nb. can omit quotes in hash context and will find right key string
print "$family_name{betty}\n";

# accessing wrong keys returns undef
my $granite = $family_name{larry};
print "$granite\n";

# evaluating a hash in a list context gives a list of key-value pairs ('unwinding')
# like (key1, value1, key2, value2...)
my @family_array = %family_name;
print "@family_array\n"; # key-value pairs returned in arbitrary order

# reverse forces list context -> can turn key-value in value-key -> values become keys in second hash
my %inverse_hash = reverse %family_name;
# of course only safe if values all unique, otherwise last one read out of first hash is kept and others discarded
# but don't know which will be last because arbitrary ordering out of hash


# for readability, instead of defining on (key, value) lists, can use 'big arrow' =>
my %last_name = (
    'fred' => 'flintstone',
    'dino' => undef,
    'barney' => 'rubble',
    betty => 'rubble', # can also omit quotes on keys as long as they don't look like reserved symbols
);

# big arrow is just a synonym for a comma, so can be used anywhere with same effect


# hash functions
my %hash = (a => 1, b => 2, c => 3);
my @k = keys %hash;
my @v = values %hash;
print "@k\n@v\n";
# again, arbitrary order, but keys will be same order as values

# in scalar context, this gives number of items
my $count = keys %hash;
print "there are $count keys in %hash\n"; # can't interpolate whole hashes, so % doesn't need escaping

# non-empty hashes return true and empty ones false
if (%hash) {
    print "That's true!\n";
}
my %hash2;
if (! %hash2) {
    print "That's false!\n";
}


# each iterates over elements, returning two-element list (key, value)
while ( (my $key, my $value) = each %hash ) {
    print "$key => $value\n";
}

# have to work differently if you want sorted output
foreach my $key ( sort keys %hash ) {
    print "$key => $hash{$key}\n";
}


# check for keys in a hash with exists
if (! exists $hash{d}) {                    # nb. $ sigil
    print "'d' is not a key in %hash\n"; 
}

# remove keys (and their values) using delete
delete $hash{'a'};
while ( (my $key, my $value) = each %hash) {
    print "$key => $value\n";
}


# %ENV contains environment variables, including anything exported before running script
while ( (my $key, my $value) = each %ENV) {
    print "$key => $value\n";
}
