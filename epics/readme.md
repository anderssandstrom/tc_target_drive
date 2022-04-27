# EPICS IOC for target drive unit


## Start IOC
``` 
iocsh.bash startTargetNew.cmd
``` 

## Preps for MPS test 

MPS wants to know rotation velocity when they trigger STO is triggered:
``` 
camonitor -n TARGET_DU:Rotation-VelAct TARGET_DU:Rotation-Drv-Stat-STOActiveCh1 TARGET_DU:Rotation-Drv-Stat-STOActiveCh2 | tee data.log
``` 

# Obsolete below (not using PILS anymore)

## Start PILS ioc

1. checkout branch target_drive_unit from fork  anderssandstrom/m-epics-EthercatMC
2. go to test dir
3. ./run-ethercatmc-ioc.sh target-testrig-rats-PILS 172.30.2.35

Need to investigate how to start without the run-ethercatmc-ioc.sh script
