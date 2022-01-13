# FAST FPGA Audio Processor Prototype   

## January 2022 Milestone

<center>
<iframe width="800" height="450" src="https://www.youtube.com/embed/_Cwk7LwjXGk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

Our current prototype of the FAST FPGA Audio Processor can reach a latency inferior to 10us thanks to the use of high-end audio codecs such as the ADAU1787. A major breakthrough since the previous version is our ability to use DDR memory on the board, allowing us to run DSP algorithms with large memory footprints such as echos, reverbs, etc.

A PCB has been developed to create a wide range of hardware interfaces to control the DSP running on the processor. 

## July 2021 Milestone

<center>
<iframe width="800" height="450" src="https://www.youtube.com/embed/acMhZe8V2ls" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

The FAST FPGA audio processor is currently being developed as part of the FAST project. It provides a round-trip audio latency inferior to 80us. It also hosts an Analog to Digital Converter (ADC) for sensors offering a "control-to-sound" latency inferior to 100us.

It is based on a [Digilent Zybo Z7 board](https://reference.digilentinc.com/programmable-logic/zybo/start) hosting a Xilinx Zynq 7000 FPGA that is used for audio processing. The FAST FPGA audio processor is fully programmable with the [Faust programming language](https://faust.grame.fr) at high level through USB.

For reference, here's the Faust program used in the above demo video:

```
import("stdfaust.lib");
oscFreq = hslider("oscFreq",80,50,5000,0.01);
lfoFreq = hslider("lfoFreq",1,0.01,50,0.01);
lfoRange = hslider("lfoRange",1000,10,5000,0.01);
oscGain = hslider("oscGain",0.5,0,1,0.01);
noiseGain = hslider("noiseGain",0,0,1,0.01);
LFO = os.lf_triangle(lfoFreq)*0.5 + 0.5;
process = os.sawtooth(oscFreq)*oscGain + no.noise*noiseGain : fi.resonlp(LFO*lfoRange+50,5,1);
```

(you can try it directly in your Web browser in the [Faust Web IDE](https://faustide.grame.fr/?autorun=1&voices=0&name=untitled2&inline=aW1wb3J0KCJzdGRmYXVzdC5saWIiKTsKb3NjRnJlcSA9IGhzbGlkZXIoIm9zY0ZyZXEiLDgwLDUwLDUwMDAsMC4wMSk7Cmxmb0ZyZXEgPSBoc2xpZGVyKCJsZm9GcmVxIiwxLDAuMDEsNTAsMC4wMSk7Cmxmb1JhbmdlID0gaHNsaWRlcigibGZvUmFuZ2UiLDEwMDAsMTAsNTAwMCwwLjAxKTsKb3NjR2FpbiA9IGhzbGlkZXIoIm9zY0dhaW4iLDAuNSwwLDEsMC4wMSk7Cm5vaXNlR2FpbiA9IGhzbGlkZXIoIm5vaXNlR2FpbiIsMCwwLDEsMC4wMSk7CkxGTyA9IG9zLmxmX3RyaWFuZ2xlKGxmb0ZyZXEpKjAuNSArIDAuNTsKcHJvY2VzcyA9IG9zLnNhd3Rvb3RoKG9zY0ZyZXEpKm9zY0dhaW4gKyBuby5ub2lzZSpub2lzZUdhaW4gOiBmaS5yZXNvbmxwKExGTypsZm9SYW5nZSs1MCw1LDEpOw%3D%3D)).

Next steps involve: 

* improving the performances of the system to run large Faust programs,
* adding more audio inputs and outputs (we're currently aiming at 32x32),
* use this system for active control.

![DSC00011](img/system.jpg)
