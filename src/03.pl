#!/usr/bin/env perl
use strict;
use warnings;

# Find out whether an array contains element x.

sub my_exists {
    my $x = shift;
    my @arr = @{shift @_};
    my $search_status = 0;
    foreach my $elem (@arr) {
        if ($elem eq $x) {
            $search_status = 1;
            last;
        }
    }
    return $search_status;
}

#testing
my $num = 10;
my $arrref_with_num = [1, 2, 3, 10, 9, 11, 12];
my $arrref_without_num = [1, 2, 4, 5, 3, 8, 9];

print my_exists($num, $arrref_with_num) . "\n";
print my_exists($num, $arrref_without_num);
