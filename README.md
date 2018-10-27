# Test2::Tools::PerlTidy [![Build Status](https://secure.travis-ci.org/plicease/Test2-Tools-PerlTidy.png)](http://travis-ci.org/plicease/Test2-Tools-PerlTidy)

Test2 check that all of your Perl files are tidy

# SYNOPSIS

# DESCRIPTION

This module lets you test your code for tidiness.  It is more or less a drop in replacement 
for [Test::PerlTidy](https://metacpan.org/pod/Test::PerlTidy), exclude that it is implemented using [Test2::API](https://metacpan.org/pod/Test2::API), and it handles 
UTF-8 (a common encoding for Perl source code) better.

# FUNCTIONS

## is\_file\_tidy

    use Test2::Tools::PerlTidy qw( is_file_tidy );
    my $bool = is_file_tidy $filename;
    my $bool = is_file_tidy $filename, $perltidyrc;

Returns true if the file is tidy or false otherwise.  Sends diagnostics via the [Test2](https://metacpan.org/pod/Test2) API. 
Exportable on request.

## list\_files

    my @files = Test2::Tools::PerlTidy::list_files $path;
    my @files = Test2::Tools::PerlTidy::list_files %args;

Generate the list of files to be tested.  Don't use this.  Included as part of the public 
interface for backward compatibility with [Test::PerlTidy](https://metacpan.org/pod/Test::PerlTidy).  Not exported.

## load\_file

    my $content = Test2::Tools::PerlTidy::load_file $filename;

Load the UTF-8 encoded file to be tested from disk and return the contents.  Don't use this.  
Included as part of the public interface for backward compatibility with [Test::PerlTidy](https://metacpan.org/pod/Test::PerlTidy).  
Not exported.

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2018 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
