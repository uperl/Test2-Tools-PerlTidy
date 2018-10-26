use Test2::V0 -no_srand => 1;
use Test2::Tools::PerlTidy;
use Path::Tiny qw( path );

subtest 'list files' => sub {

  is(
    intercept { Test2::Tools::PerlTidy::list_files './corpus/not-there' },
    array {
      event Bail => sub {
        call reason => './corpus/not-there does not exist';
      };
      end;
    }
  );

  is(
    intercept { Test2::Tools::PerlTidy::list_files('./corpus/just-a-file') },
    array {
      event Bail => sub {
        call reason => './corpus/just-a-file is not a directory';
      };
      end;
    }
  );

  is(
    intercept { Test2::Tools::PerlTidy::list_files(exclude => 'string') },
    array {
      event Bail => sub {
        call reason => 'exclude must be an array';
      };
      end;
    }
  );

  chdir 'corpus/list-files';

  is(
    [Test2::Tools::PerlTidy::list_files('.')],
    [qw(
      Makefile.PL
      lib/Foo/Bar/Baz.pm
      t/foo_bar_baz.t
    )],
  );

  is(
    [Test2::Tools::PerlTidy::list_files(path => '.', exclude => [qr/\.pm$/])],
    [qw(
      Makefile.PL
      t/foo_bar_baz.t
    )],
  );

  is(
    [Test2::Tools::PerlTidy::list_files(path => '.', exclude => ['t/'])],
    [qw(
      Makefile.PL
      blib/no-match.pm
      lib/Foo/Bar/Baz.pm
    )],
  );

  chdir '../..';

};

done_testing
