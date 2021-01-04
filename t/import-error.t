use strict;
use warnings;

use App::perlimports ();
use Devel::Confess;
use Test::More import => [qw( diag done_testing is is_deeply ok )];

my $source_text = 'use Local::Module::Does::Not::Exist::At::All;';

my $e = App::perlimports->new(
    filename    => 'test-data/geo-ip.pl',
    source_text => $source_text,
);

is(
    $e->formatted_ppi_statement,
    $source_text,
    'formatted_ppi_statement unchanged'
);

ok( $e->has_errors, 'has_errors' );

done_testing();