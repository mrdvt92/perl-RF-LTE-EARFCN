use strict;
use warnings;

use Test::More tests => 15;
BEGIN { use_ok('RF::LTE::EARFCN') };

my $obj = RF::LTE::EARFCN->new;

isa_ok($obj, 'RF::LTE::EARFCN');
can_ok($obj, 'new');
can_ok($obj, 'channel');
can_ok($obj, 'channel_type');
can_ok($obj, 'band');
can_ok($obj, 'fdl');
can_ok($obj, 'ful');
can_ok($obj, 'fs');

is($obj->channel(5110), 5110, 'channel');
is($obj->channel_type, 'dl', 'channel_type');
is($obj->band, '12', 'band');
is($obj->fdl, 739, 'fdl');
is($obj->ful, 709, 'ful');
is($obj->fs, 30, 'fs');

