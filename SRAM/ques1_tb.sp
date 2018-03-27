* Part 1 - Static Stability Analysis
* Question 1 - Butterfly curve of SRAM Read Mode

.TEMP 25
.OPTION

.include "/afs/asu.edu/users/a/p/a/aparame2/Memories/32nm_HP.pm"
.include "./ques1.sp"

Vgnd gnd! 0 DC=0V
Vvdd vcc! 0 DC=0.9V

X_hf wl bl in out sram1

Vwl wl 0 DC=0.9V
Vbl bl 0 DC=0.9V
Vin in 0 DC=0V
 
Cbl bl 0 100f

.DC Vin 0 0.9 0.001 

.probe v(*)
.option post
.end
