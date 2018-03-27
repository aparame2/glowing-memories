* Part2 - Dynamic Stability Analysis
* Ques1a - Read Margin Calaculation in Dynamic Mode

.TEMP 25
.OPTION

.param tr=30p
.param tf=30p
.param pw=500p
.param period=8n 
.param vdd=0.9V

.include "/afs/asu.edu/users/a/p/a/aparame2/Memories/32nm_HP.pm"
.include "./ques1a.sp"

Vgnd gnd! 0 DC=0V
Vvdd vcc! 0 DC=0.9V

X_hf1 wl bl qb q sram1
X_hf2 wl blb q qb sram1

* IC is used to set node voltages in Transient mode
.IC V(qb)=0.9V V(q)=0 V(bl)=0.9V V(blb)=0.9V

Vwl wl 0 PULSE (0 0.9 2000p tr tf pw 1000p)

Cbl bl 0 100f
Cblb blb 0 100f

.tran 2p 8n Start=0.0 UIC

.probe v(*)
.option post
.end
