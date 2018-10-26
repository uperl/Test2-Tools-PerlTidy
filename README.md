# Test2::Tools::PerlTidy [![Build Status](https://secure.travis-ci.org/plicease/Test2-Tools-PerlTidy.png)](http://travis-ci.org/plicease/Test2-Tools-PerlTidy)

Test2 check that all of your Perl files are tidy

# SYNOPSIS

# DESCRIPTION

This module lets you test your code for tidiness.  It is more or less a drop in replacement for [Test::PerlTidy](https://metacpan.org/pod/Test::PerlTidy), exclude that it is implemented using [Test2::API](https://metacpan.org/pod/Test2::API), and it handles UTF-8 (a common 
encoding for Perl source code) better.

# FUNCTIONS

## list\_files

    my @files = list_files $path;
    my @files = list_files %args;

Generate the list of files to be tested.  Don't use this.  Included as part of the public interface for
backward compatibility with [Test::PerlTidy](https://metacpan.org/pod/Test::PerlTidy).

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2018 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
