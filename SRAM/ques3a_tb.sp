* Part 1 - Static Stability Analysis
* Ques 3a - Write Margin

.TEMP 25
.OPTION MEASFORM=1

.include "/afs/asu.edu/users/a/p/a/aparame2/Memories/32nm_HP.pm"
.include "./ques3a.sp"

Vgnd gnd! 0 DC=0V
Vvdd vcc! 0 DC=0.9V

X_hf1 wl bl qb q sram1
X_hf2 wl blb q qb sram1

Vblb blb 0 DC=0.9V
Vbl bl 0 DC=0.9V
Vwl wl 0 DC=0.9V

* Set node voltages q and qb to VDD and 0V
.NODESET qb 0.9V q 0

.DC Vblb 0.9 0 -0.01

* Calculate Write Margin when Q and Qb flips
.measure DC WSNM FIND V(blb) WHEN V(q) = V(qb)

.probe v(*)
.option post
.end
