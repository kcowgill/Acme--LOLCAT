#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 3;

use_ok('Acme::LOLCAT');
ok Acme::LOLCAT->can('has');
ok Acme::LOLCAT->can('haz');


