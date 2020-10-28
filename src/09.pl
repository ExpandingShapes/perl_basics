#!/usr/bin/env perl

use strict;
use warnings;
use utf8;
use open qw(:std :utf8);

# Функция склонения: 1 новость, 2 новости, 10 новостей.
# Использовать тернарный оператор ?:.

sub get_news_declension {
    my $news_count = shift;
    my $two_last_digits = $news_count % 100;
    my $last_digit = $two_last_digits % 10;
  
    ($two_last_digits >= 10 && $two_last_digits <= 14) ? return "$news_count новостей" :
        $last_digit == 1 ? return "$news_count новость" :
        $last_digit >= 5 || $last_digit == 0 ? return "$news_count новостей" :
        return "$news_count новости";
}

#testing
print get_news_declension(1) , "\n";
print get_news_declension(2) , "\n";
print get_news_declension(10) , "\n";
print get_news_declension(645);
