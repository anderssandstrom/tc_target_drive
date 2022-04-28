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

