package Hook::Scope;

use 5.005;
use strict;

require Exporter;
require DynaLoader;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
@ISA = qw(Exporter
	DynaLoader);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Hook::Scope ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.

@EXPORT_OK = qw( POST );

@EXPORT = qw();

$VERSION = '0.03';

bootstrap Hook::Scope $VERSION;

1;
__END__

=head1 NAME

Hook::Scope - Perl extension for adding hooks for exiting a scope

=head1 SYNOPSIS

  use Hook::Scope; 
  {
    Hook::Scope::POST(sub { print "I just left my scope"});
    print "you will see this first!";
  }
 
  use Hook::Scope qw(POST);   # only POST can be exported
  {
    POST { print "foo" };
    POST  sub { print "bar"}; # can have multiple POSTs, last added, first run
  }

=head1 ABSTRACT

This module allows you to register subroutines to be executed when the scope 
they were registered in, has been left.

=head1 DESCRIPTION

=head2 POST

C<POST> takes a reference to a subroutine or a subroutine name and will 
register that subroutine to be executed when the scope is left.  Note that
even if the scope is left using die(), the subroutine will be executed.

=head2 EXPORT

None by default.  POST can be exported if so required.

=head1 SEE ALSO

L<Hook::LexWrap>

Please report any bugs using the bug report interface at rt.cpan.org or
using E<lt>bug-Hook-Scope@rt.cpan.orgE<gt>

=head1 AUTHOR

Arthur Bergman, E<lt>abergman@cpan.orgE<gt>

Thanks go to Nick Ing-Simmons for the wicked idea of LEAVE;ENTER;.

=head1 COPYRIGHT AND LICENSE

Copyright 2002 by Arthur Bergman

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 

=cut
