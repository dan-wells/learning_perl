#!/usr/local/bin/perl
use utf8;

@array = qw( 1 2 3 4 5 );
# @removed = splice(@array, 2); # remove index 2 and everything after
# @removed = splice @array, 1, 2; # remove two elements starting at index 1
# @removed = splice @array, 1, 2, qw( 6 ); # remove two elements from index 1 and insert '6'
@removed = splice @array, 1, 0, qw(6); # don't remove anything but insert at index 1
print "@removed, @array\n";


@rocks = qw/ bedrock slate lava /;
foreach $rock (@rocks) { # can't modify $rock if you have `foreach $rock (qw/blah/)` -- read-only value
    $rock = "\t$rock";
    $rock .= "\n";
}
print "The rocks are:\n", @rocks;


# @fred = 6..10;
# @wilma = reverse 6..10;
# @fred = reverse @fred; # doesn't reverse in place
# print "@wilma, @fred\n";


@rocks = qw/ bedrock slate rubble granite /;
@sorted = sort(@rocks);
@back = reverse sort @rocks;
print "@rocks, @sorted, @back\n";

@numbers = sort 97..102;
print "@numbers\n"; # sorts ascii-betical => 100, 101, 102, 97, 98, 99
# additional argument for numeric sorting
@ascending = sort {$a <=> $b} @numbers;
@descending = sort {$b <=> $a} @numbers;
print "@ascending, @descending\n";



# enumerate functionality
# each operator on arrays in v5.12+
require v5.12;
while( ( $index, $value ) = each @rocks ) { # while => until we run out of @rocks
    print "$index: $value\n";
}
# otherwise iterate through indices and pull values out:
foreach $index (0.. $#rocks) {
    print "$index: $rocks[$index]\n";
}


# contexts 
@people = qw/ fred barney wilma /;
@list = @people; # list context gives list of three people from @people
$n = @people; # scalar context gives length of @people
print "@list, $n\n";

@backwards = reverse qw/ yabba dabba doo /; # reverses lists
$backwards = reverse qw/ yabba dabba doo/; # reverses and concatenates strings in list
print "@backwards, $backwards\n";

# assigning scalar results in a list context gives a one-element list
@fred = 6 * 7; # gives (42)
@barney = "hello" . ' ' . "world"; # gives ("hello world")
print "$fred[0], $barney[0]\n";

print "I have $#rocks rocks!\n"; # fills in last index !
print "I have ", scalar @rocks, " rocks!\n"; # forces scalar context, gives number of items !!
print "I have $rocks rocks!\n"; # doesn't work !


# reading stdin into an array gives all lines in a file or from user input terminated by ctrl-d
print "These will print on separate lines: ";
@lines = <STDIN>;
print @lines;
print "These will be printed on a single line: ";
chomp(@lines = <STDIN>);
print @lines; 
