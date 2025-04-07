import("stdfaust.lib");

//Reverb
reverb=ba.bypass2(rbp,dattorro_rev_demo)
with{
        rbp = button("Bypass [switch:5]");
};
dattorro_rev_demo = _,_ <: re.dattorro_rev(pre_delay, bw, i_diff1, i_diff2, decay, d_diff1, d_diff2, damping),_,_:
    dry_wet
with {

    pre_delay = 0;
    bw = 0.7;
    i_diff1 = 0.625;
    i_diff2 = 0.625;
    d_diff1 = 0.625;
    d_diff2 = 0.625;
    decay = 0.7;
    damping = 0.625;
    dry_wet(x,y) = *(dry) + wet*x, *(dry) + wet*y 
    with {
        wet = 0.5*(drywet+1.0);
        dry = 1.0-wet;
    };
    drywet = hslider("reverb [slider:7]",0,-1.0,1.0,0.01) : si.smoo;
};



// Flanger

flanger_custom=flanger_stereo_demo
with{

    invert = 0;

    flanger_stereo_demo(x,y) = x,y : pf.flanger_stereo(dmax,curdel1,curdel2,depth,fb,invert);

    lfol = os.oscrs;
    lfor = os.oscrc;

    dmax = 2048;
    dflange = 0.001 * ma.SR *10;
    odflange = 0.001 * ma.SR *1;
    freq   = hslider("Speed [knob:4]", 0.5, 0, 10, 0.01);
    depth  = hslider("Depth [knob:3]", 1, 0, 1, 0.001);
    fb     = hslider("Feedback [knob:2]", 0, 0, 1, 0.001);
    curdel1 = odflange+dflange*(1 + lfol(freq))/2;
    curdel2 = odflange+dflange*(1 + lfor(freq))/2;
};

//drive


drive = hslider("Drive [knob:1]",
        0, 0, 1, 0.01);
offset = 0;
cubicnl(drive,offset) = *(pregain) : +(offset) : clip(-1,1) : cubic
with {
    pregain = pow(10.0,2*drive);
    clip(lo,hi) = min(hi) : max(lo);
    cubic(x) = x - x*x*x/3;
    postgain = max(1.0,1.0/pregain);
};





master	= hslider("master [slider:8]", 1, 0, 1, 0.01);
killswitch = 1-button("killSwitch [switch:6]");
process =cubicnl(drive,offset)<:flanger_custom:reverb:_*master*killswitch,_*master*killswitch;


