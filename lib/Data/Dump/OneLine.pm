package Data::Dump::OneLine;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use Data::Dmp;

our @ISA = qw(Data::Dmp);
our @EXPORT = (@Data::Dmp::EXPORT, 'dump1', 'dump_one_line');

*dump1 = \&Data::Dmp::dmp;
*dump_one_line = \&Data::Dmp::dmp;

1;
#ABSTRACT: Dump data structures as single-line strings

=for Pod::Coverage ^(.+)$

=head1 SYNOPSIS

 use Data::Dump::OneLine; # exports dd and dmp
 $str = dd(@list);

=head1 DESCRIPTION


=head1 SEE ALSO

L<JSON> should also encode to a single-line string, but some data structures
(cyclical, contains globs or other special Perl data) cannot be encoded out of
the box to JSON.

L<Data::Dumper::OneLine> strives to do the same for L<Data::Dumper>, but last
time I tried it (at v0.05) it's still buggy.

=cut
