# Test2::Tools::PerlTidy [![Build Status](https://secure.travis-ci.org/plicease/Test2-Tools-PerlTidy.png)](http://travis-ci.org/plicease/Test2-Tools-PerlTidy)

Test2 check that all of your Perl files are tidy

# SYNOPSIS

# DESCRIPTION

This module lets you test your code for tidiness.  It is more or less a drop in replacement
for [Test::PerlTidy](https://metacpan.org/pod/Test::PerlTidy), except that it is implemented using [Test2::API](https://metacpan.org/pod/Test2::API), and it handles
UTF-8 (a common encoding for Perl source code) better, and works on windows.

# FUNCTIONS

## run\_tests

    run_tests %args;

Test all perl files for tidiness.  Options:

- exclude

    `run_tests` will look for files to test under the current directory recursively.  by default
    it will exclude files in the `./blib/` directory.  Set `exclude` to a list reference to
    exclusion criteria if you need to exclude additional files.  Strings are assumed to be
    path prefixes and regular expressions can be used to match any part of the file path name.

    Note that unlike [Test::PerlTidy](https://metacpan.org/pod/Test::PerlTidy), this module does NOT use
    [File::Spec](https://metacpan.org/pod/File::Spec)`->canonpath` before matching is attempted, because that breaks
    this module on windows.  Instead [Path::Tiny](https://metacpan.org/pod/Path::Tiny) is used which gives consistent results on both
    UNIX and Windows.

- path

    Set `path` to the path of the top-level directory that contains the files to be
    tested.  Defaults to `.`.

- perltidyrc

    By default the usual locations for the **perltidy** file will be searched.  You can use
    this to override a specific tidy file.

- mute

    Off by default, silence diagnostics.

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
