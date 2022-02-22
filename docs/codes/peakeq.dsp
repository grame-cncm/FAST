
declare name "filterBank";
declare description "Graphic Equalizer consisting of a filter-bank driving a bank of faders";

import("stdfaust.lib");
mth_octave_filterbank_demo(O) = fi.mth_octave_filterbank(3,M,ftop,N): sum(i,N,(*(ba.db2linear(fader(N-i)))))
with{
    M = O;
    N = 5*M; // total number of bands (highpass band, octave-bands, dc band)
    ftop = 10000;

    fader(1) = vslider("Band0 [slider:1]", -10, -70, 10, 0.1) : si.smoo;
    fader(2) = vslider("Band1 [slider:3]", -10, -70, 10, 0.1) : si.smoo;
    fader(3) = vslider("Band2 [slider:5]", -10, -70, 10, 0.1) : si.smoo;
    fader(4) = vslider("Band3 [slider:7]", -10, -70, 10, 0.1) : si.smoo;
    fader(5) = vslider("Band4 [slider:8]", -10, -70, 10, 0.1) : si.smoo;
};

process = mth_octave_filterbank_demo(1);
