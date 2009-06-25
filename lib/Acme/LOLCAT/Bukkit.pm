package Acme::LOLCAT::Bukkit;

use Moose;
use Moose::Util::TypeConstraints;

subtype 'ReplStr'
  => as 'Str';

coerce 'ReplStr'
  => from 'ArrayRef[Str]'
  => via { $_->[ rand( $#{ $_ } + 1 ) ] };

has 'replacement' => (
  is     => 'rw',
  isa    => 'ReplStr',
  coerce => 1,
);

has 'word' => (
  is  => 'rw',
  isa => 'RegexpRef',
);

1;
