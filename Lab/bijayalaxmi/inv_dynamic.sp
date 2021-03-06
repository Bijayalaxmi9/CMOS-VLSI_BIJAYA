######## Dynamic characteristic of Inverter #########







































































































































































































































































































































































































































































































































































































































































** inv char 
.LIB /project2020/eda/ngspice-32/models/scn4m_subm/scmos_bsim4.lib nom
.TEMP 27

.GLOBAL Vdd gnd
.PARAM Wn=0.6u
.PARAM Wp=2.71*Wn

* circuit definition
Vin	in	gnd	pulse	0	2.5	10n	10p	10p	5n	10n
Vsup	Vdd	gnd	DC	2.5
MP1	out	in	Vdd	Vdd	scmosp	W=Wp	L=0.4u	m=1
MN1	out	in	gnd	gnd	scmosn	W=Wn	L=0.4u	m=1

* fanout gate
MP2	out1	out	Vdd	Vdd	scmosp	W=2.4u	L=0.4u	m=1	
MN2	out1	out	gnd	gnd	scmosn	W=2.4u	L=0.4u	m=1

* transient analysis
.TRAN	 5p	50n

.CONTROL
RUN
PLOT V(in)+3 V(out)
.ENDC
* measuring statements
.MEASURE tran tdiff TRIG V(in) val=1.25 FALL=1 TARG V(out) val=1.25 RISE=1 //TPLH
.MEASURE tran tdiff TRIG V(in) val=1.25 RISE=1 TARG V(out) val=1.25 FALL=1 //TPHL
.MEASURE tran tdiff TRIG V(out) val=0.25 RISE=2 TARG V(out) val=2.25 RISE=2 //T-RISE
.MEASURE tran tdiff TRIG V(out) val=2.25 FALL=2 TARG V(out) val=0.25 FALL=2 //T-FALL
.END
