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
%EXPORT_TAGS = ( 'all' => [ qw(
			       leave	
			       ) ] );

@EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

@EXPORT = qw(
);

$VERSION = '0.01';

bootstrap Hook::Scope $VERSION;



1;
__END__

=head1 NAME

Hook::Scope - Perl extension for adding hooks for exiting a scope

=head1 SYNOPSIS

  use Hook::Scope; 
  {
    Hook::Scope::leave(sub { print "I just left my scope"});
    print "you will see this first!";
  }
 
  use Hook::Scope qw(leave);
  {
    leave { print "foo" };
    leave sub { print "bar"};
  }


=head1 ABSTRACT

This module allows you to register hooks to run when the scope it 
is registred in has been left.

=head1 DESCRIPTION

=head2 leave

leave takes a reference to a subroutine or a subroutine name and will 
register a hook to run when the scope is left, note that even if the scope
is left using die() the hook is run

=head2 EXPORT

None by default.



=head1 SEE ALSO

l<Hook::LexWrap>

Please report any bugs using the bug report interface at rt.cpan.org

=head1 AUTHOR

Arthur Bergman, E<lt>abergman@cpan.orgE<gt>

Thanks go to Nick Ing-Simmons for the wicked idea of LEAVE;ENTER;

=head1 COPYRIGHT AND LICENSE

Copyright 2002 by Arthur Bergman

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 

=cut


