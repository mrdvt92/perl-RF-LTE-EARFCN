use Test::More;
eval "use Test::Spelling";
plan skip_all => "Test::Spelling required for testing POD spelling" if $@;
add_stopwords(<DATA>);
all_pod_files_spelling_ok();

__DATA__
DL
Downlink
EARFCN
ETSI
IoT
LTE
NB1
NB2
NDL
NOffs
NUL
UTRA
Uplink
V17
downlink
fdl
fs
ful
uplink
ul
dl
