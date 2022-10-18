# MUTS

## TDU cabinet:
IndraDrive error 8022 Encoder Error already at startup
Pinged cable OK still 8022


## AVS box
IndraDrive error 8022 Encoder Error
Phases chnaged to correct order in inlet to box.
Phases changed to correct orde on motor junction box (on drive unit)
Inverted encoder (I think)
Inverted scaling to run CCW

This works!! Hmmm..

Check with eider what she know on phase order issues (she also mentioned this)

Got no time to revisit TDU cabinte to get that working.

Need investigation!!!

Working parmans saved in this repo..


# Indradrive configs
Use: IndraWorks Ds 14V24 P1

Connect to drive with EoE via ams id: 172.30.2.35.1.1

## Good diagnostic screen at:
1. IndraDriveDS->
2. Overview->
3. press velocity control
4. All these are interssting:
  - Cmd val selection
  - Cmd val masking
  - Ramp function generator (the acc and dec is from PLC process image, the second acc and dec can be chnaged here, I increased the second values)
  - Motion. limit values (here I reduced the jerk filter time from 1000 to 5 resulting in much better phasing perf)

## reverse dir in
Reverse dir can be done in:
Axis->axis mechanics scalings

# Encoder
If reference track not ok alarm in indra. Then a power cycle of encoder make it work again (atleast once)


