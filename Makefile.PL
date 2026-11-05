use ExtUtils::MakeMaker;
WriteMakefile(
    NAME              => 'RF::LTE::EARFCN',
    VERSION_FROM      => 'lib/RF/LTE/EARFCN.pm',
    PREREQ_PM         => {
                          'Package::New' => 0, #new
                          'Carp'         => 0, #croak
                          'Scalar::Util' => 0, #dualvar
                         },
    ABSTRACT_FROM     => 'lib/RF/LTE/EARFCN.pm',
    AUTHOR            => 'Michael R. Davis <mrdvt92@yahoo.com>',
    LICENSE           => 'mit',
);
