use strict;
use warnings;

use Test::More tests => 1;
BEGIN { use_ok('RF::LTE::EARFCN') };

my $obj = RF::LTE::EARFCN->new;

isa_ok($obj, 'RF::LTE::EARFCN');
can_ok($obj, 'new');
can_ok($obj, 'channel');
can_ok($obj, 'band');
can_ok($obj, 'fdl');
can_ok($obj, 'ful');
can_ok($obj, 'fs');

is($obj->channel(5110), 5110, 'channel');
is($obj->band, '12');
is($obj->fdl, 729, 'fdl');
is($obj->ful, 699, 'ful');
is($obj->fs, 30);

