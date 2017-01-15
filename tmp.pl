#!/usr/local/bin/perl
use utf8;

$fred[0] = "yabba";
$fred[1] = "dabba";
$fred[2] = "doo";
$fred[4] = "you missed one";

print "@fred\n";

foreach (@fred) {
    print "$_\n";
}

$end = $#fred;
print "$end\n";
print "$fred[ $#fred ]\n";
print "$fred[-1]\n";

@three = (1, 2, 3);
print "@three\n";

@ten = (1..10);
print "@ten\n";

@stones = qw( fred barney betty wilma dino );
foreach (@stones) {
    print "$_\n";
}

@more = (@stones, @fred);
print "@more\n";

### p.49 pop and push
