#!/usr/bin/env perl
use warnings;
use strict;
use Data::Dumper;

$, = " ";

# Given two arrays, return their symmetric difference.

sub get_symmetric_difference {
  my @arr1 = @{shift @_};
  my @arr2 = @{shift @_};
    
  local *get_difference_of = sub {
    my %hash_of_arr = ();
    my @arr_result = ();
    
    foreach my $x (@{$_[0]}) {
        $hash_of_arr{$x} = 1;
    }
    
    # If there is no key $value in the hash, put
    # $value in @arr_result.
    foreach my $value (@{$_[1]}) {
        if ( !exists $hash_of_arr{$value}) {
            push @arr_result, $value;
        }
    }
    
    return @arr_result;
  };

    # The union of complement of arr2 in arr1 and vice versa
    # which is equal to the symmetric difference of arr1 and arr2.
    return (get_difference_of(\@arr1, \@arr2), get_difference_of(\@arr2, \@arr1));
}

#testing
my $test_arrref1 = [7, 4, 8, 3, 6, 3, 7, 23];
my $test_arrref2 = [8, 3, 7, 27, 9, 4, 3, 4];
print Dumper get_symmetric_difference($test_arrref1, $test_arrref2);
