#!/usr/bin/env perl

use strict;
use warnings;
use utf8;
use open qw(:std :utf8);

$, = ', ';

# Sort an array of words such that words beginning with a Cyrillic letter would go first,
# and after them words beginning with a number/Latin character would go.

sub sort_cyrillic_first {
    return sort { lc($b) cmp lc($a) } @{shift @_};
}

#testing
print sort_cyrillic_first(['banana', 'watermelon', 'лимон', '2 апельсина', '3 grapes'])
