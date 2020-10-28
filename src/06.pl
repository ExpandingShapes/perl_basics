#!/usr/bin/env perl

use strict;
use warnings;

# Generate a key - 10 characters of 'A'..'Z', 'a'..'z', '0'..'9'.

sub generate_key {
    my %hash = ();
    my @arr = ();
    
    for ('a'..'z') {
        $hash{$_} = 1;
    }
    for ('A'..'Z') {
        $hash{$_} = 1;
    }
    for ('0'..'9') {
        $hash{$_} = 1;
    }
    
    @arr = keys %hash;
    return @arr[0..9];
}

#testing
for(1..5) {
    print generate_key() , "\n";
}
    
