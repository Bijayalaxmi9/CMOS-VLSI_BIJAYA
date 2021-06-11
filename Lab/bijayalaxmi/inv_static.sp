########### inverter static characteristics ##############


* Include  model file
.LIB /project2020/eda/ngspice-32/models/scn4m_subm/scmos_bsim4.lib nom
.TEMP 27

*.PARAM Wn=1u
*.PARAM Wp=3*Wn
*.PARAM Lc=1u
* define supply

Vsupply	Vd	0	DC	2.5
Vin	in	0	DC	2.5

* Define MOSFET
MP1	out	in	Vd	Vd	scmosp	W=3u	L=1u	m=1
MN1	out	in	0	0	scmosn	W=1u	L=1u	m=1


MP2	out2	in	Vd	Vd	scmosp	W=3u	L=1u	m=1
MN2	out2	in	0	0	scmosn	W=3u	L=1u	m=1

MP3	out3	in	Vd	Vd	scmosp	W=9u	L=1u	m=1
MN3	out3	in	0	0	scmosn	W=1u	L=1u	m=1
* Sweep input voltage
.DC	Vin	0	2.5	0.001

.CONTROL
RUN
PLOT V(out) V(out2) V(out3) vs V(in)
.ENDC
.END	
