* Part 1 - Static Stability Analysis
* Question 2 - partc - Read Margin Vs VDD

.TEMP 25
.OPTION

.include "/afs/asu.edu/users/a/p/a/aparame2/Memories/32nm_HP.pm"
.include "./ques2c.sp"

* Variable u and pvcc can be swept
.param u=0
.param pvcc=0V								

Vgnd gnd! 0 DC=0V
Vvdd vcc! 0 DC=pvcc

* SRAM full circuit in Read Mode
X_hf1 wl1 bl1 in1 out1 sram1
X_hf2 wl2 bl2 in2 out2 sram1

Vwl1 wl1 0 DC=pvcc
Vbl1 bl1 0 DC=pvcc
Cbl1 bl1 0 100f

Vwl2 wl2 0 DC=pvcc
Vbl2 bl2 0 DC=pvcc
Cbl2 bl2 0 100f

*in1 and in2 are already defined as VCVS no need for voltage sources

Evx v1 0 VOL='(sqrt(2)*V(out1))+u'
Ex in1 0 VOL='((1/sqrt(2))*u)+((1/sqrt(2))*V(v1))'

Evy v2 0 VOL='(sqrt(2)*V(out2))-u'
Ey in2 0 VOL='(((1/sqrt(2))*V(v2))-(1/sqrt(2))*u)'

Exy v12 0 VOL='V(v1)-V(v2)'

* SNM Calculation
.measure DC maxi MAX V(v12)
.measure DC mini MIN V(v12)
.measure DC absmin PARAM='sqrt(mini*mini)'
.measure DC absmax PARAM='sqrt(maxi*maxi)'
.measure DC minx PARAM='MIN(absmin,absmax)'
.measure DC snm param='minx/1.414'
 
.DC u '-(pvcc/1.414)' 'pvcc/1.414' 0.001 pvcc 0.9 0.3 -0.1

.probe v(*)
.option post
.end
