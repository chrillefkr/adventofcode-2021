#!/usr/bin/perl

use strict;
use warnings;

my $horizontal = 0;
my $depth = 0;
my $aim = 0;

open(my $in,  "<",  "input.txt")  or die "Can't open input.txt: $!";

while (my $line = <$in>) {
	my $value;
	my $dir;
	($dir, $value) = $line =~ m/^(forward|down|up) ([0-9]+)$/g;
	$aim -= $value if $dir eq 'up';
	$aim += $value if $dir eq 'down';
	$horizontal += $value if $dir eq 'forward';
	$depth += $aim * $value if $dir eq 'forward';
}

print "Horizontal: ${horizontal}\n";
print "Depth: ${depth}\n";
print "Product: ", $horizontal * $depth, "\n";

