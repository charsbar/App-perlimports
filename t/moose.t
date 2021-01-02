use strict;
use warnings;

use lib 't/lib';

use App::perlimports ();
use Test::More import => [qw( done_testing is is_deeply ok )];

my $e = App::perlimports->new(
    filename    => 't/lib/UsesMoose.pm',
    source_text => 'use Moose;',
);
is(
    $e->_module_name(), 'Moose',
    '_module_name'
);

is_deeply( $e->_exports, [], 'No _exports' );
ok( $e->_is_ignored, '_is_ignored' );
is_deeply( $e->_imports, [], 'No _imports' );
is(
    $e->formatted_ppi_statement,
    q{use Moose;},
    'formatted_ppi_statement'
);

done_testing();
