# Test2::Tools::PerlTidy ![linux](https://github.com/uperl/Test2-Tools-PerlTidy/workflows/linux/badge.svg) ![macos](https://github.com/uperl/Test2-Tools-PerlTidy/workflows/macos/badge.svg) ![windows](https://github.com/uperl/Test2-Tools-PerlTidy/workflows/windows/badge.svg)

Test2 check that all of your Perl files are tidy

# SYNOPSIS

# DESCRIPTION

This module lets you test your code for tidiness.  It is more or less a drop in replacement
for [Test::PerlTidy](https://metacpan.org/pod/Test::PerlTidy), except that it is implemented using [Test2::API](https://metacpan.org/pod/Test2::API), and it handles
UTF-8 (a common encoding for Perl source code) better, and works on windows.

# FUNCTIONS

## run\_tests

```
run_tests %args;
```

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

    By default the usual locations for the **perltidyrc** file will be searched.  You can use
    this to override a specific tidy file.

- mute

    Off by default, silence diagnostics.

- skip\_all

    Set `skip_all` to a true value to skip the whole test file.  There isn't really a good
    reason to use this over the [Test2::V0](https://metacpan.org/pod/Test2::V0) `skip_all` function.

- no\_plan

    Set `no_plan` to skip the plan.  By default a plan with the number of files to be tested is
    performed.  There isn't really a good reason to use this over a `done_testing` call, but
    this is the default to maintain backward compatibility with [Test::PerlTidy](https://metacpan.org/pod/Test::PerlTidy).

## is\_file\_tidy

```perl
use Test2::Tools::PerlTidy qw( is_file_tidy );
my $bool = is_file_tidy $filename;
my $bool = is_file_tidy $filename, $perltidyrc;
```

Returns true if the file is tidy or false otherwise.  Sends diagnostics via the [Test2](https://metacpan.org/pod/Test2) API.
Exportable on request.

## list\_files

```perl
my @files = Test2::Tools::PerlTidy::list_files $path;
my @files = Test2::Tools::PerlTidy::list_files %args;
```

Generate the list of files to be tested.  Don't use this.  Included as part of the public
interface for backward compatibility with [Test::PerlTidy](https://metacpan.org/pod/Test::PerlTidy).  Not exported.

## load\_file

```perl
my $content = Test2::Tools::PerlTidy::load_file $filename;
```

Load the UTF-8 encoded file to be tested from disk and return the contents.  Don't use this.
Included as part of the public interface for backward compatibility with [Test::PerlTidy](https://metacpan.org/pod/Test::PerlTidy).
Not exported.

# CAVEATS

This module uses [Text::Diff](https://metacpan.org/pod/Text::Diff) to compare how untidy files are different from the tidy
counterparts.  By default [Text::Diff](https://metacpan.org/pod/Text::Diff) escapes Unicode characters, which keeps the tables
lined up correctly even when the characters are of different widths.  You can change
this behavior by setting `$Text::Diff::Config::Output_Unicode` to a true value.  For
example:

```perl
use Test2::Tools::PerlTidy;

local $Text::Diff::Config::Output_Unicode = 1;
run_tests;
```

will print out any Unicode characters as-is, but may produce table cells that do not
line up if the characters are of different widths.

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2018-2024 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
