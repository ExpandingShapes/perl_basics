#!/usr/bin/env perl
use warnings;
use strict;

$, = " ";

# Given an array of integers, return the array in ascending order
# with duplicate elements removed. Separate array's elements by whitespace.

sub get_unique_sorted{
    my @arr = @{shift @_};
    my %seen = ();
    return sort grep { !$seen{$_}++ } @arr;
}

#testing
my $test_arrref = [0, 6, 2, 2, 3, 1, 1, 74];
print get_unique_sorted($test_arrref);
