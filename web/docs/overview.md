# Overview of FAST

## Context and Positioning

Embedded systems for audio and multimedia are increasingly used in the arts and culture (e.g., interactive systems, musical instruments, virtual and augmented reality, artistic creation tools, musical composition and performance, etc.). However, programming them can be out of reach to artists, creators, or non-specialized engineers. In parallel with the emergence of the [maker culture](https://makerfaire.com/maker-movement) progress have been made to make these types of systems more accessible, bringing more flexibility in digital approaches to artistic creation. For instance, the [Arduino platform](https://www.arduino.cc) greatly simplified the programming process of microcrontrollers. Similarly, Domain Specific programming Langages (DSL) such as [Faust](https://faust.grame.fr) [0] facilitated the implementation of real-time audio Digital Signal Processing (DSP) algorithms.

>> Faust is a DSL for real-time audio signal processing primarily developed at GRAME-CNCM and by a worldwide community. Faust is based on a compiler "translating" DSP specifications written in Faust into a wide range of lower-level languages (e.g., C, C++, Rust, Java, WASM, LLVM bitcode, etc.). Thanks to its "architecture" system, generated DSP objects can be embedded into template programs (wrappers) used to turn a Faust program into a specific ready-to-use object (e.g., standalone, plug-in, smartphone app, webpage, etc.). 

However, many limitations remain, especially for real-time applications where latency plays a crucial role (e.g., efficient active control of sound where audio processing should be faster than the propagation of sound [1], digital musical instruments playability [2], digital audio effects, etc.). While latency can be potentially reduced on "standard" computing platforms such as personal computers based on a CPU (Central Processing Unit), going under the "one millisecond threshold" is usually impossible because of buffering.

FPGAs (Field Programmable Gate Arrays) can help solve this problem as well as most of the limitations of traditional computing platforms used for musical and artistic applications. These chips are known for their high computational capabilities [3,4] and very low-latency performances [5]. They also provide a large number of GPIOs (General Purpose Inputs and Outputs) which can be exploited to implement modern real-time multi-channel processing algorithms (e.g., sound fields capture using a very large number of digital microphones [6], active sound control over a large spatial region [7], etc.). 

But FPGAs remain extremely complex to program, even with state-of-the-art high-level tools, making them largely inaccessible to musicians, digital artists and makers communities.

>> FPGAs are configured/programmed using a Hardware Description Language (HDL) such as VHDL or Verilog. The learning curve and the electrical engineering skills required to master these types of environments make them out of reach to the real-time audio DSP community. Solutions exist to program FPGAs at a higher level (i.e., [LabVIEW](https://www.ni.com/fr-fr/shop/labview.html), [Vivado HLS](https://www.xilinx.com/HLS), etc.), but none of them is specifically dedicated nor adapted to real-time audio DSP.

There are currently only a few examples of professional FPGA-based real-time audio DSP systems (i.e., [Antelope Audio](https://en.antelopeaudio.com), [Korora Audio](https://www.kororaaudio.com), etc.) and in these applications, FPGAs are dedicated to a specific task, limiting creativity and flexibility.

## Objectives and Research Hypothesis

The FAST project was thought to overcome the aforementioned difficulties (i.e., low latency, computing capacity, multi-channel, and ease of programming). **The goal of FAST is to design an FPGA-based platform for multichannel ultra-low-latency audio Digital Signal Processing (DSP) programmable at a high-level with Faust** and usable for various applications ranging from sound synthesis and processing to active sound control and artificial sound field/room acoustics. In addition to that, we then plan to use this tool to: 

* design a programmable sound processing/synthesizer module for musicians, artists, and makers; 
* actively modify the acoustical properties of acoustic musical instruments and create "smart/hybrid instruments;"
* create a studio/rehearsing space with an adaptive acoustic.

FAST gathers the strengths of [GRAME-CNCM](http://grame.fr) (Faust, compilation, musical audio applications, dissemination/mediation, professional music production), [CITI](http://www.citi-lab.fr) at INSA Lyon (FPGA, DSP, fixed-point processing with [FloPoCo](http://flopoco.gforge.inria.fr)), and [LMFA](http://lmfa.ec-lyon.fr) at École Centrale de Lyon (acoustics, DSP, artificial reverberation, active control).

The main objective of FAST is to **develop a new Faust architecture backend for FPGA-based platforms**. One of the challenges here is the optimization of the module generated by Faust. The real breakthrough will be obtained with the use of two recent technologies in the Faust compilation workflow: *(i)* High Level Synthesis (HLS) for compiling Faust programs to VHDL and *(ii)* fixed-point support in the code generated by the Faust compiler, building on the expertise developed at CITI around the FloPoCo project. Eventually, we aim at generating VHDL code directly from the Faust compiler. 

This type of system has a wide range of applications in multiple domains. As mentioned earlier, music technology is in high demand for low latency because it helps increasing the playability of musical instruments on stage. Hence, the platform developed as part of FAST will be used to design programmable digital musical instruments and effect processors. In that context, the computational power of the FPGA will be exploited to run complex algorithms (e.g., physics-based models of musical instruments [8], modal reverbs [9], etc.) that are too costly to run on a traditional platform (i.e., laptop, etc.). GRAME-CNCM has decades of experience in that domain. 

We plan to **implement two hardware/software audio DSP modules based on the platform** implemented in FAST. One will target the makers and music technology communities and will provide a stereo input and output as well as GPIOs for sensors. The other will target active acoustic control and spatial audio applications by providing 32 audio inputs and outputs.

One of the main field of application for the platform that we plan to develop as part of FAST is active control of acoustical spaces (e.g., noise cancellation in rooms, car passenger compartment, etc.) and virtual room acoustics (e.g., to apply the acoustical properties of a space to another, etc.). Sound field rendering systems are in high demand for low audio latency (i.e., to beat acoustical waves traveling at the speed of sound in the air) and high computational power (i.e., to implement Finite Difference Time Domain: FDTD schemes [8]. While FPGAs have been used in the past for this type of applications [10], there is a lack for a high-level tool to program and implement these types of algorithms. LMFA École Centrale has a lot of experience in these domains and a wide range of equipment at its disposal (e.g., sound field array/listening room, etc.) that will be used/adapted to this purpose. We plan to **prototype real-world examples of room acoustics simulation/modifications** that could then be used in a concert setting. The platform that we plan to implement as part of FAST will be used to take this type of system to a completely different level. Hence, we plan to organize events centered around these concepts with the help of GRAME-CNCM music production department. In particular, **we will design a system to recreate the acoustics of various landmarks from the Lyon area in LMFA's listening room to turn it into an immersive studios** where small events open to the public will be organized. 

Finally, applications around active control are not limited to acoustical spaces. Musical instrument acoustics/digital lutherie are increasingly using these types of techniques [11] not to mention industrial applications outside of the field of audio (e.g., aircraft jet engine vibration control, etc.) which would be easily reachable thanks to LMFA's expertise in these domains [12].

## Bibliography

[0] Yann Orlarey, Stéphane Letz, and Dominique Fober. New Computational Paradigms for Computer Music.

[1] Stephen Elliott. Signal Processing for Active Control. Elsevier, 2000.

[2] Nelson Lago and Fabio Kon. The quest for low latency. In Proceedings of the International Computer Music Conference (ICMC-04), Miami, USA, 2004.

[3] Jiwon Choi, Myeongsu Kang, Yongmin Kim, Cheol-Hong Kim, and Jong-Myon Kim. Design space exploration in many-core processors for sound synthesis of plucked string instruments. Journal of Parallel and Distributed Computing, 73(11):1506–1522, 2013.

[4] Florian Pfeifle and Rolf Bader. Real-time finite difference physical models of musical instruments on a field programmable gate array (fpga).
In Proceedings of the 15th International Conference on Digital Audio Effects (DAFx-12), York, UK, 2012.

[5] Math Verstraelen, Jan Kuper, and Gerard J.M. Smit. Declaratively programmable ultra low-latency audio effects processing on fpga. In Proceedings of the 17th International Conference on Digital Audio Effects (DAFx-14), Erlangen, Germany, 2014.

[6] Edouard Salze, Emmanuel Jondeau, Antonio Pereira, Simon L. Prigent, and Christophe Bailly. A new MEMS microphone array for the wavenumber analysis of wall-pressure fluctuations: Application to the modal investigation of a ducted low-Mach number stage. In Proceedings of the 25th AIAA/CEAS Aeroacoustics Conference, Delft, Netherlands, 2019.

[7] Jihui Zhang, Thushara D. Abhayapala, Wen Zhang, Prasanga N. Samarasinghe, and Shouda Jiang. Active noise control over space: A wave domain approach. IEEE/ACM Transactions on Audio, Speech, and Language Processing, 26(4):774–786, April 2018.

[8] Stefan Bilbao. Numerical Sound Synthesis: Finite Difference Schemes and Simulation in Musical Acoustics. John Wiley and Sons, Chichester, UK, 2009.

[9] Jonathan S Abel, Wieslaw Woszczyk, Doyuen Ko, Scott Levine, Jonathan Hong, Travis Skare, Michael J Wilson, Sean Coffin, and Fernando Lopez-Lezcano. Recreation of the acoustics of hagia sophia in stanford’s bing concert hall for the concert performance and recording of cappella romana. In Proceedings of the International Symposium on Room Acoustics, Toronto, Canada, 2013.

[10] Yiyu Tan and Toshiyuki Imamura. An fpga-based accelerator for sound field rendering. In Proceedings of the 22nd International Conference on Digital Audio Effects (DAFx-19), Birmingham, UK, 2019.

[11] Jihui Zhang, Thushara D. Abhayapala, Wen Zhang, Prasanga N. Samarasinghe, and Shouda Jiang. Active noise control over space: A wave domain approach. IEEE/ACM Transactions on Audio, Speech, and Language Processing, 26(4):774–786, April 2018.

[12] Edouard Salze, Emmanuel Jondeau, Antonio Pereira, Simon L. Prigent, and Christophe Bailly. A new MEMS microphone array for the wavenumber analysis of wall-pressure fluctuations: Application to the modal investigation of a ducted low-Mach number stage. In Proceedings of the 25th AIAA/CEAS Aeroacoustics Conference, Delft, Netherlands, 2019.

