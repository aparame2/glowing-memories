* Part 1 - Static Stability Analysis
* Ques 3a - Write Margin Vs VDD

.TEMP 25
.OPTION MEASFORM=3

.param pvcc=0.9V

.include "/afs/asu.edu/users/a/p/a/aparame2/Memories/32nm_HP.pm"
.include "./ques3b.sp"

Vgnd gnd! 0 DC=0V
Vvdd vcc! 0 DC=pvcc

X_hf1 wl bl qb q sram1
X_hf2 wl blb q qb sram1

Vwl wl 0 DC=pvcc
Vblb blb 0 DC=pvcc
Vbl bl 0 DC=pvcc

* Set node voltages q and qb to VDD and 0V
.NODESET qb pvcc q 0

.DC Vblb 0.9 0 -0.01 pvcc 0.9 0.3 -0.1

* Calculate Write Margin when Q and Qb flips
.measure DC WSNM FIND V(blb) WHEN V(q) = V(qb)

.probe v(*)
.option post
.end
