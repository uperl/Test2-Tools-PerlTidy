package Test2::Tools::PerlTidy;

use strict;
use warnings;
use 5.008001;
use Test2::API qw( context );
use File::Find ();
use Path::Tiny qw( path );

# ABSTRACT: Test2 check that all of your Perl files are tidy
# VERSION

=head1 SYNOPSIS

=head1 DESCRIPTION

This module lets you test your code for tidiness.  It is more or less a drop in replacement for L<Test::PerlTidy>, exclude that it is implemented using L<Test2::API>, and it handles UTF-8 (a common 
encoding for Perl source code) better.

=head1 FUNCTIONS

=head2 list_files ( [ I<start_path> | I<%args> ] )

 my @files = list_files $path;
 my @files = list_files %args;

Generate the list of files to be tested.  Don't use this.  Included as part of the public interface for
backward compatibility with L<Test::PerlTidy>.

=cut

sub list_files
{
  my %args;
  my $path;

  # path as only argument is for backward compatability with Test::PerlTidy
  if(@_ > 1)
  {
    %args = @_;
    $path = $args{path};
  }
  else
  {
    ($path) = @_;
  }

  $path ||= '.';

  my $ctx = context();

  $ctx->bail("$path does not exist") unless -e $path;
  $ctx->bail("$path is not a directory") unless -d $path;

  my $excludes = $args{exclude} || [qr/^blib\//];   # exclude blib by default

  $ctx->bail("exclude must be an array")
    unless ref $excludes eq 'ARRAY';

  my @files;

  File::Find::find(
    sub {
      my $filename = $_;
      return if -d $filename;
      my $path = path($File::Find::name);
      $DB::single = 1;
      foreach my $exclude (@$excludes)
      {
        return if ref $exclude ? $path =~ $exclude : $path =~ /^$exclude/;
      }
      push @files, $path if $filename =~ /\.(?:pl|pm|PL|t)$/;
    },
    $path,
  );

  $ctx->release;

  map { "$_" } sort @files;
}

1;
