#!/usr/bin/env perl

use strict;
use warnings;

{
    package Animal;
  
    sub new {
        my ($class, $args) = @_;
        my $self = {
            age => $args->{age}
        };
        bless $self, $class;
        return $self;
    }
  
    sub age {
        my ($self, $value) = @_;
        if (@_ == 2) {
            $self->{age} = $value;
        }
        return $self->{age};

    }

    sub DESTROY {
        print "An animal has been destroyed.\n";
    }
}

{
    package Cat;
    
    use parent -norequire, 'Animal';
    
    use overload 
        '+' => \&plus;
        
    sub new {
        my ($class, $args) = @_;
        my $self = {
            lifes => $args->{lifes} || 9,
            age => $args->{age}
        };
        bless $self, $class;
        return $self;
    }
    
    sub lifes {
        my ($self, $value) = @_;
        if (@_ == 2) {
            $self->{lifes} = $value;
        }
        return $self->{lifes};
    }
  
    sub plus {
        my ($self, $second_cat) = @_;
        my $new_lifes = $self->lifes + $second_cat->lifes;
        $self->lifes($self->lifes - 1);
        return bless {lifes => $new_lifes}, 'Cat';
    }
    
    sub DESTROY {
        print "A cat has been destroyed.\n";
    }
}

#testing
my $cat1 = bless {lifes => 15}, 'Cat';
my $cat2 = Cat->new();
my $new_cat = $cat1 + $cat2;
print 'cat1 has ', $cat1->lifes , " lifes\n";
print 'cat2 has ', $cat2->lifes , " lifes\n";
print 'new_cat has ', $new_cat->lifes , " lifes\n";
