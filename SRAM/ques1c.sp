* Dynamic Read Margin

.GLOBAL vcc!
+        gnd!

.SUBCKT sram1 wl bl in out
*PG
MM0 bl wl out gnd! nmos w=35n l=30n 
*PD
MM1 out in gnd! gnd! nmos w=70n l=30n
*PU
MM2 out in vcc! vcc! pmos w=35n l=30n


.ENDS
