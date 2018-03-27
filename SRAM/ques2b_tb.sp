* Part 1 - Static Stability Analysis
* Question 2 - partb - Read Margin Vs Width of PD

.TEMP 25
.OPTION MEASFORM=3

.include "/afs/asu.edu/users/a/p/a/aparame2/Memories/32nm_HP.pm"
.include "./ques2b.sp"

* Variable u can be swept
.param u=0								

Vgnd gnd! 0 DC=0V
Vvdd vcc! 0 DC=0.9V

X_hf1 wl1 bl1 in1 out1 sram1
X_hf2 wl2 bl2 in2 out2 sram1

Vwl1 wl1 0 DC=0.9V
Vbl1 bl1 0 DC=0.9V
Cbl1 bl1 0 100f

Vwl2 wl2 0 DC=0.9V
Vbl2 bl2 0 DC=0.9V
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
 
.DC u -0.550 0.550 0.001 x 70n 175n 35n

.probe v(*)
.option post
.end
