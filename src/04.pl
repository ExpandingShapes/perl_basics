#!/usr/bin/env perl
use strict;
use warnings;

$, = " ";

# Given an array, randomize it.

sub randomize_array {
    my @arr = @{shift @_};
    
    my %hash = ();
    for (@arr) {
        $hash{$_} = 1;
    }
    return keys %hash;
}

#testing
my $arrref = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

print randomize_array($arrref);
