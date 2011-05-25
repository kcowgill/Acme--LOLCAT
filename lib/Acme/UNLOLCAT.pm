#!/usr/bin/perl

package Acme::UNLOLCAT;

use strict;
use warnings;

use 5.006_001; # 'our' requires a "more recent" perl.

use Exporter;

our @ISA = qw/Exporter/;
our @EXPORT = qw/untranslate/;

our $VERSION = '0.0.5';

my %repl = (
   qr/\b(?:wut|whut)\b/,
   what,
   qw/\b(?:yu|yous|yoo|u)\b/,
   'you\b',

   'oh hai,',
   'hello,',
);

# At some point I should really just remove this file
# from the module, it doesn't do anything, and I think
# it would be too hard to implement well.
sub untranslate {
  my $phrase = lc shift;

  $phrase =~ s{
                $_
              }
              {
                $repl{ $_ }
              }gex
              for keys %repl;

  $phrase =~ s/\s{2,}/ /g;
  $phrase =~ s/teh teh/teh/g; # meh, it happens sometimes.
  if( int rand 10 == 2 ){ $phrase .= '.  kthxbye!' }
  if( int rand 10 == 1 ){ $phrase .= '.  kthx.' }
  $phrase =~ s/(\?|!|,|\.)\./$1/;
  return "\u\L$phrase";
}

1;

=pod

=head1 NAME

Acme::UNLOLCAT - Stop speaking like a lolcat

=head1 VERSION

Version 0.0.5

=head1 USAGE

This module translates "LOLCAT" sentences into english.  For more
information on LOLCAT, please consult wikipedia:
(L<http://en.wikipedia.org/wiki/Lolcat>)

  use strict;
  use warnings;

  use Acme::UNLOLCAT;

  my $phrase = untranslate( "YU 2 CAN STAWP SPEEK LIEK LOLCAT! KTHX." );

  print $phrase;

  Output:

  You too can stop speaking like a lolcat!

=head1 EXPORTS

=over

=item untranslate

Exports the function "untranslate" into your namespace.

Pass untranslate some text, untranslate returns some UNLOLCATed text.

If you prefer to call untranslate() with the fully qualified name,
and don't want untranslate() to be exported into your namespace:

  use Acme::UNLOLCAT ();

  # ...

  my $translated_text
    = Acme::UNLOLCAT::untranslate( $lolcat_text );

=back

=head1 REAL-TIME DEMONSTRATION

I've created a quick and dirty ajax powered web page to show how easy
Acme:UNLOLCAT is to use.  Point your web browser here:

L<http://www.kentcowgill.org/unlolcat.html>

The backend CGI that accepts and responds to the ajax requests is very
simple:

  #!/usr/bin/perl

  use strict;
  use warnings;

  use CGI qw/:standard/;
  use Acme::UNLOLCAT;

  print header( -type => 'text/html'),
        untranslate( param( 'lolcat' );

... where 'lolcat' is the name of the textarea where input is accepted.

=head1 DEPENDENCIES

Requires C<Exporter>.

=head1 AUTHOR

Kent Cowgill C<kent@c2group.net>, L<http://www.kentcowgill.org>

=head1 REQUESTS AND BUGS

Please report any requests, suggestions, or bugs via the RT bug tracking
system at L<http://rt.cpan.org>.

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Acme::UNLOLCAT> is the RT queue
to Acme::UNLOLCAT. Please check to see if your bug has already been reported.

=head1 ACKKNOWLEDGMENTS

Thanks to Jon Rockway for the idea.

=head1 COPYRIGHT AND LICENSE

Copyright (c) 2008 by Kent Cowgill

This library is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.

See L<http://www.perl.com/perl/misc/Artistic.html>

=cut

__END__

   cture,
   'kshur',
   unless,
   'unles',
   'the\b',
   'teh',
   more,
   'moar',
   my,
   [qw/muh mah/],
   are,
   [qw/r is ar/],
   eese,
   'eez',
   ph,
   'f',
   'as\b',
   'az',
   seriously,
   'srsly',
   'er\b',
   'r',
   sion,
   'shun',
   just,
   'jus',
   'ose\b',
   'oze',
   eady,
   'eddy',
   'ome?\b',
   'um',
   'of\b',
   [qw/of ov of/],
   'uestion',
   'wesjun',
   want,
   'wants',
   'ead\b',
   'edd',
   ucke,
   [qw/ukki ukke/],
   sion,
   'shun',
   eak,
   'ekk',
   age,
   'uj',
   like,
   [qw/likes liek/],
   love,
   [qw/loves lub lubs luv/],
   '\bis\b',
   ['ar teh','ar'],
   'nd\b',
   'n',
   who,
   'hoo',
   q('),
   q(),
   'ese\b',
   'eez',
   outh,
   'owf',
   scio,
   'shu',
   esque,
   'esk',
   ture,
   'chur',
   '\btoo?\b',
   [qw/to t 2 to t/],
   tious,
   'shus',
   'sure\b',
   'shur',
   'tty\b',
   'tteh',
   were,
   'was',
   'ok\b',
   [ qw/'k kay/ ],
   '\ba\b',
   q(),
   ym,
   'im',
   'thy\b',
   'fee',
   '\wly\w',
   'li',
   'que\w',
   'kwe',
   oth,
   'udd',
   ease,
   'eez',
   'ing\b',
   [qw/in ins ng ing/],
   'have',
   ['has', 'hav', 'haz a'],
   your,
   [ qw/yur ur yore yoar/ ],
   'ove\b',
   [ qw/oov ove uuv uv oove/ ],
   for,
   [ qw/for 4 fr fur for foar/ ],
   thank,
   [ qw/fank tank thx thnx/ ],
   good,
   [ qw/gud goed guud gude gewd/ ],
   really,
   [ qw/rly rily rilly rilley/ ],
   world,
   [ qw/wurrld whirld wurld wrld/ ],
   q(i'?m\b),
   'im',
   '(?!e)ight',
   'ite',
   '(?!ues)tion',
   'shun',
   q(you'?re),
   [ qw/yore yr/ ],
   '\boh\b(?!.*hai)',
   [qw/o ohs/],
   'can\si\s(?:ple(?:a|e)(?:s|z)e?)?\s?have\sa',
   'i can has',
