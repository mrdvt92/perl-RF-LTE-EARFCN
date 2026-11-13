use strict;
use warnings;

use Test::More tests => 50;
BEGIN { use_ok('RF::LTE::EARFCN') };

my $rf = RF::LTE::EARFCN->new;

isa_ok($rf, 'RF::LTE::EARFCN');
can_ok($rf, 'new');
can_ok($rf, 'channel');
can_ok($rf, 'channel_type');
can_ok($rf, 'band');
can_ok($rf, 'fdl');
can_ok($rf, 'ful');
can_ok($rf, 'fs');

is($rf->channel(5110), 5110, 'set channel');
is($rf->channel, 5110, 'read channel');
is($rf->channel_type, 'dl', 'channel_type');
is($rf->band, '12', 'band');
is($rf->fdl, 739, 'fdl');
is($rf->fs, 30, 'fs');
is($rf->ful, 709, 'ful');

#NOTE 2: Restricted to E-UTRA operation when carrier aggregation is configured.
is($rf->channel(9660), 9660, 'channel for downlink only band 29');
is($rf->channel_type, 'dl', 'channel_type');
is($rf->band, '29', 'band');
is($rf->fdl, 717, 'fdl');
is($rf->fs, 'n/a', 'fs');   #expect error
is($rf->ful, 'n/a', 'ful'); #expect error

diag("Band 24 with FS = -101.5");

is($rf->channel(7701), 7701, 'channel: 7701 - set channel');
is($rf->channel, 7701, 'channel: 7701 - read channel');
is($rf->channel_type, 'dl', 'channel: 7701 - channel_type');
is($rf->band, '24', 'channel: 7701 - band');
is($rf->fdl, 1525.1, 'channel: 7701 - fdl');
is($rf->fs, -101.5, 'channel: 7701 - fs');
is($rf->ful, 1626.6, 'channel: 7701 - ful');

{
  diag("Band 24 with FS = -120.5");
  local $RF::LTE::EARFCN::FS_TABLE{24} = -120.5;
  is($rf->channel, 7701, 'channel: 7701 fs: -120.5 - read channel');
  is($rf->channel_type, 'dl', 'channel: 7701 fs: -120.5 - channel_type');
  is($rf->band, '24', 'channel: 7701 fs: -120.5 - band');
  is($rf->fs, -120.5, 'channel: 7701 fs: -120.5 - fs');
  is($rf->fdl, 1525.1, 'channel: 7701 fs: -120.5 - fdl');
  is($rf->ful, 1645.6, 'channel: 7701 fs: -120.5 - ful'); #1626.5 + (-101.5) - (-120.5) #should the whole table be shifted?
}
is($rf->fs, -101.5, 'local test - fs');

diag("Band 24 with FS = -101.5");

is($rf->channel(25701), 25701, 'channel: 25701 - set channel');
is($rf->channel, 25701, 'channel: 25701 - read channel');
is($rf->channel_type, 'ul', 'channel: 25701 - channel_type');
is($rf->band, '24', 'channel: 25701 - band');
is($rf->fs, -101.5, 'channel: 25701 - fs');
is($rf->ful, 1626.6, 'channel: 25701 - ful');
is($rf->fdl, 1525.1, 'channel: 25701 - fdl');

{
  diag("Band 24 with FS = -120.5");
  local $RF::LTE::EARFCN::FS_TABLE{24} = -120.5;
  is($rf->channel, 25701, 'channel: 25701 fs: -120.5 - read channel');
  is($rf->channel_type, 'ul', 'channel: 25701 fs: -120.5 - channel_type');
  is($rf->band, '24', 'channel: 25701 fs: -120.5 - band');
  is($rf->fs, -120.5, 'channel: 25701 fs: -120.5 - fs');
  local $@;
  eval{$rf->ful};
  my $error = $@;
  ok($error);
  like($error, qr/frequency separation is not the default value/, 'channel: 25701 fs: -120.5 - ful');
  #is($rf->fdl, 1525.1, 'channel: 25701 fs: -120.5 - fdl');
}
is($rf->fs, -101.5, 'local test - fs');
