Testbench for inverter subcircuit
.GLOBAL vdd gnd
.PARAM vsupply=5.0
.LIB "/project2020/eda/ngspice-32/models/scn4m_subm/scmos_bsim4.lib" nom

.INCLUDE Lab9_inverter.sp

Xinv1 in out Lab9_inverter
Xinv2 in out Lab9_inverter
Vsup vdd 0 DC vsupply
vin in 0 pulse(0 vsupply 5n 10p 10p 10n 20)
Cload out 0 50f
.TRAN 10p 20n
.MEASURE TRAN TPLH TRIG v(in) val='0.5*vsupply' FALL=1 TARG v(out) VAL='0.5*vsupply' RISE=1
.MEASURE TRAN TPHL TRIG v(in) val='0.5*vsupply' RISE=1 TARG v(out) VAL='0.5*vsupply' FALL=1
.CONTROL
RUN
PLOT v(in) v(out)
.ENDC
.END    
