# NAME

RF::LTE::EARFCN - LTE EARFCN Channel Converter to Band and Frequency

# SYNOPSIS

    use RF::LTE::EARFCN;
    my $rf = RF::LTE::EARFCN->new(channel=>5110);
    say for "Channel: "              . $rf->channel,
            "Channel Type: "         . $rf->channel_type,
            "Band: "                 . $rf->band,
            "Frequency (dl): "       . $rf->fdl,
            "Frequency (ul): "       . $rf->ful,
            "Frequency Separation: " .  $rf->fs;

# DESCRIPTION

This LTE EARFCN Channel to Band and Frequency Converter uses the functions and tables in sections 5.7.3 of ETSI TS 136 101 V17.6.0 (2022-08) to convert EARFCN Channel to Band (band), Frequency Downlink (fdl), Frequency Uplink (ful), and Frequency Separation (fs).

The carrier frequency in the uplink and downlink is designated by the E-UTRA Absolute Radio Frequency Channel
Number (EARFCN) in the range 0 - 262143. The relation between EARFCN and the carrier frequency in MHz for the
downlink is given by the following equation, where FDL\_low and NOffs\_DL are given in Table 5.7.3-1 and NDL is the
downlink EARFCN.

    FDL = FDL_low + 0.1(NDL - NOffs_DL)

The relation between EARFCN and the carrier frequency in MHz for the uplink is given by the following equation
where FUL\_low and NOffs\_UL are given in Table 5.7.3-1 and NUL is the uplink EARFCN.

    FUL = FUL_low + 0.1(NUL - NOffs_UL)

# METHODS

## new

# PROPERTIES

## channel

Sets and returns the EARFCN channel number.  The logic is written so that the channel number can be either the downlink or uplink channel number and the correct frequency calculation is used.

    my $rf = RF::LTE::EARFCN->new(channel=>5110);
    $rf->channel(5110);
    my $channel = $rf->channel;

## channel\_type

Returns either 'ul' or 'dl' based on whether the channel is an uplink or downlink channel number.

    my $channel_type = $rf->channel_type; #ISA String 'dl'||'ul'

## channel\_offset

Returns channel offset used for calculating uplink or downlink EARFCN

    my $channel_offset = $rf->channel_offset; #ISA Int

## band, fdl\_low, noffs\_dl, range\_ndl\_lower, range\_ndl\_upper, ful\_low, noffs\_ul, range\_nul\_lower, range\_nul\_upper

Returns the table values directly from the table based on the channel.

    my $band = $rf->band;

## fdl

Calculates and returns the downlink carrier frequency in MHz.

    my $frequency_downlink_mhz = $rf->fdl;

The relation between EARFCN and the carrier frequency in MHz for the downlink is given by the following equation, where FDL\_low and NOffs\_DL are given in Table 5.7.3-1 and NDL is the downlink EARFCN.

    FDL = FDL_low + 0.1(NDL - NOffs_DL)

## ful

Calculates and returns the uplink carrier frequency in MHz.

    my $frequency_uplink_mhz = $rf->ful;

The relation between EARFCN and the carrier frequency in MHz for the uplink is given by the following equation where FUL\_low and NOffs\_UL are given in Table 5.7.3-1 and NUL is the uplink EARFCN.

    FUL = FUL_low + 0.1(NUL - NOffs_UL)

Returns undef for bands that are restricted to E-UTRA operation when carrier aggregation is configured.

## fs

Calculates the TX-RX frequency separation in MHz from Table 5.7.3-1 based on the difference between FDL\_low and FUL\_low.

    my $frequency_separation_mhz = $rf->fs;

Returns undef for bands that are restricted to E-UTRA operation when carrier aggregation is configured.

# SEE ALSO

[https://www.etsi.org/deliver/etsi\_ts/136100\_136199/136101/17.06.00\_60/ts\_136101v170600p.pdf](https://www.etsi.org/deliver/etsi_ts/136100_136199/136101/17.06.00_60/ts_136101v170600p.pdf)
[https://github.com/qvil/lte-earfcn-calculator](https://github.com/qvil/lte-earfcn-calculator)

# AUTHOR

Michael R. Davis

# COPYRIGHT AND LICENSE

Copyright (C) 2026 by Michael R. Davis

License: MIT
