* SNM for Read SRAM
.GLOBAL vcc!
+       gnd!

.SUBCKT sram1 wl bl in out

*Pass Gate PG
MM0 bl wl out gnd! nmos w=35n l=30n 
*Pull Down PD
MM1 out in gnd! gnd! nmos w=70n l=30n
*Pull up PU
MM2 out in vcc! vcc! pmos w=35n l=30n

.ENDS
