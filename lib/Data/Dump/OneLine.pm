package Data::Dump::OneLine;
# ABSTRACT: Use Data::Dump to produce dumps that fit in one line

use 5.010;
use strict;
use warnings;
use Data::Dump;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(dump_oneline dump1);

=head1 SYNOPSIS

 use Data::Dump::OneLine qw(dump_oneline dump1);

 # just use like Data::Dump's dump()
 dump_oneline(...);

=head1 DESCRIPTION

This module uses L<Data::Dump> to produce dumps that fits in one line, that is,
it strips all literal newlines. Great for dumping on to a shell-style comment in
code, etc.

=cut

=head1 FUNCTIONS

=head2 dump_oneline(...)

Dump one or more data structures on a single line. Uses L<Data::Dump::Filtered>
as the backend.

=cut

sub dump_oneline {
    local $_ = Data::Dump::dump(@_);

    s/^\s*#.*//mg; # comments
    s/^\s+//mg; # indents
    s/\n+/ /g; # newlines

    print STDERR "$_\n" unless defined wantarray;
    $_;
}

1;

=head2 dump1

An alias for dump_oneline().

=cut

sub dump1 { dump_oneline(@_) }

=head1 SEE ALSO

L<Data::Dump::Filtered>

=cut
