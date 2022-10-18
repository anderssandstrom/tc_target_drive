#require ads,2.0.2
require ads,master

##############################################################################
############# Configure ads device driver:
# 1.  Asyn port name                         :  "TARGET_ADS"
# 2.  IP                                     :  "172.30.2.35"
# 3.  AMS of plc                             :  "172.30.2.35.1.1"
# 4.  Default ams port                       :  851 for plc 1, 852 plc 2 ...
# 5.  Parameter table size (max parameters)  :  1000
# 6.  priority                               :  0
# 7.  disable auto connnect                  :  0 (autoconnect enabled)
# 8.  default sample time ms                 :  500
# 9.  max delay time ms (buffer time in plc) :  1000
# 10. ADS command timeout in ms             :  1000  
# 11. default time source (PLC=0,EPICS=1)   :  0 (PLC) NOTE: record TSE field need to be set to -2 for timestamp in asyn ("field(TSE, -2)")

epicsEnvSet("ADS_ASYN_PORT",      "TARGET_ADS_PORT")
epicsEnvSet("PREFIX",             "TARGET_DU:")
epicsEnvSet("EC_MASTER_ID",       "0")
epicsEnvSet("ADSPORT_DEF",        "852")
epicsEnvSet("SAMPLE_RATE_MS_DEF", "500");
epicsEnvSet("MAX_DLY_MS_DEF",     "100");

#adsSetLocalAddress "172.30.2.35.1.1"
adsAsynPortDriverConfigure("${ADS_ASYN_PORT}","172.30.12.18","172.30.12.18.1.1",${ADSPORT_DEF},1000,0,0,${SAMPLE_RATE_MS_DEF},${MAX_DLY_MS_DEF},1000,0)
#adsSetLocalAddress "172.30.2.52.1.1"

asynOctetSetOutputEos("${ADS_ASYN_PORT}", -1, "\n")
asynOctetSetInputEos("${ADS_ASYN_PORT}", -1, "\n")
asynSetTraceMask("${ADS_ASYN_PORT}", -1, 0x41)

##############################################################################
############# Load records

## Rotation
dbLoadRecords("./db/rotationHwStatus.db","P=${PREFIX},PORT=${ADS_ASYN_PORT},DEV_NAME=Rotation,STRUCT_STAT=stHwStatusRot,STRUCT_CMD=stHwControlRot")
dbLoadRecords("./db/rotationStatus.db","P=${PREFIX},PORT=${ADS_ASYN_PORT},DEV_NAME=Rotation")
dbLoadRecords("./db/indraDriveStatus.db","P=${PREFIX},PORT=${ADS_ASYN_PORT}")
dbLoadRecords("./db/indraDriveCommand.db","P=${PREFIX},PORT=${ADS_ASYN_PORT}")
#dbLoadRecords("./db/brake.db","P=${PREFIX},PORT=${ADS_ASYN_PORT}")
dbLoadRecords("./db/rotationHome.db","P=${PREFIX},PORT=${ADS_ASYN_PORT}")


## general Stuff, Fuses and so
dbLoadRecords("./db/general.db","P=${PREFIX},PORT=${ADS_ASYN_PORT},DEV_NAME=DEV")


## Stepper X
dbLoadRecords("./db/xyz.db","P=${PREFIX},PORT=${ADS_ASYN_PORT},DEV_NAME=X,STRUCT_STAT=stHwStatusX, STRUCT_CMD=stHwControlX, AXIS_NO=1")
dbLoadRecords("./db/tcMotionAxis.db","P=${PREFIX},PORT=${ADS_ASYN_PORT},DEV_NAME=X,AXIS_INDEX=1")
dbLoadRecords("./db/xyz_resolver.db","P=${PREFIX},PORT=${ADS_ASYN_PORT},DEV_NAME=X,SLAVE_ID=10")

## Stepper Y
dbLoadRecords("./db/xyz.db","P=${PREFIX},PORT=${ADS_ASYN_PORT},DEV_NAME=Y,STRUCT_STAT=stHwStatusY, STRUCT_CMD=stHwControlY, AXIS_NO=2")
dbLoadRecords("./db/tcMotionAxis.db","P=${PREFIX},PORT=${ADS_ASYN_PORT},DEV_NAME=Y,AXIS_INDEX=2")
dbLoadRecords("./db/xyz_resolver.db","P=${PREFIX},PORT=${ADS_ASYN_PORT},DEV_NAME=Y,SLAVE_ID=11")

## Stepper Z
dbLoadRecords("./db/xyz.db","P=${PREFIX},PORT=${ADS_ASYN_PORT},DEV_NAME=Z,STRUCT_STAT=stHwStatusZ, STRUCT_CMD=stHwControlZ, AXIS_NO=3")
dbLoadRecords("./db/tcMotionAxis.db","P=${PREFIX},PORT=${ADS_ASYN_PORT},DEV_NAME=Z,AXIS_INDEX=3")
dbLoadRecords("./db/xyz_resolver.db","P=${PREFIX},PORT=${ADS_ASYN_PORT},DEV_NAME=Z,SLAVE_ID=12")

# Load hardware
epicsEnvSet("EC_SLAVE_NUM",    "2")
epicsEnvSet("EC_HWTYPE",       "EL1809")
dbLoadTemplate("./db/${EC_HWTYPE}.substitutions","P=${PREFIX},PORT=${ADS_ASYN_PORT},ADDR=0,TIMEOUT=1,ADSPORT=${ADSPORT_DEF},MASTER_ID=${EC_MASTER_ID},SLAVE_POS=${EC_SLAVE_NUM},HWTYPE=${EC_HWTYPE},T_SMP_MS=${SAMPLE_RATE_MS_DEF},TSE=${TSE=0}")

epicsEnvSet("EC_SLAVE_NUM",    "3")
epicsEnvSet("EC_HWTYPE",       "EL1809")
dbLoadTemplate("./db/${EC_HWTYPE}.substitutions","P=${PREFIX},PORT=${ADS_ASYN_PORT},ADDR=0,TIMEOUT=1,ADSPORT=${ADSPORT_DEF},MASTER_ID=${EC_MASTER_ID},SLAVE_POS=${EC_SLAVE_NUM},HWTYPE=${EC_HWTYPE},T_SMP_MS=${SAMPLE_RATE_MS_DEF},TSE=${TSE=0}")

epicsEnvSet("EC_SLAVE_NUM",    "4")
epicsEnvSet("EC_HWTYPE",       "EL2819")
dbLoadTemplate("./db/${EC_HWTYPE}.substitutions","P=${PREFIX},PORT=${ADS_ASYN_PORT},ADDR=0,TIMEOUT=1,ADSPORT=${ADSPORT_DEF},MASTER_ID=${EC_MASTER_ID},SLAVE_POS=${EC_SLAVE_NUM},HWTYPE=${EC_HWTYPE},T_SMP_MS=${SAMPLE_RATE_MS_DEF},TSE=${TSE=0}")

epicsEnvSet("EC_SLAVE_NUM",    "5")
epicsEnvSet("EC_HWTYPE",       "EL2819")
dbLoadTemplate("./db/${EC_HWTYPE}.substitutions","P=${PREFIX},PORT=${ADS_ASYN_PORT},ADDR=0,TIMEOUT=1,ADSPORT=${ADSPORT_DEF},MASTER_ID=${EC_MASTER_ID},SLAVE_POS=${EC_SLAVE_NUM},HWTYPE=${EC_HWTYPE},T_SMP_MS=${SAMPLE_RATE_MS_DEF},TSE=${TSE=0}")

epicsEnvSet("EC_SLAVE_NUM",    "6")
epicsEnvSet("EC_HWTYPE",       "EL9505")
dbLoadTemplate("./db/${EC_HWTYPE}.substitutions","P=${PREFIX},PORT=${ADS_ASYN_PORT},ADDR=0,TIMEOUT=1,ADSPORT=${ADSPORT_DEF},MASTER_ID=${EC_MASTER_ID},SLAVE_POS=${EC_SLAVE_NUM},HWTYPE=${EC_HWTYPE},T_SMP_MS=${SAMPLE_RATE_MS_DEF},TSE=${TSE=0}")

epicsEnvSet("EC_SLAVE_NUM",    "7")
epicsEnvSet("EC_HWTYPE",       "EL1252")
dbLoadTemplate("./db/${EC_HWTYPE}.substitutions","P=${PREFIX},PORT=${ADS_ASYN_PORT},ADDR=0,TIMEOUT=1,ADSPORT=${ADSPORT_DEF},MASTER_ID=${EC_MASTER_ID},SLAVE_POS=${EC_SLAVE_NUM},HWTYPE=${EC_HWTYPE},T_SMP_MS=${SAMPLE_RATE_MS_DEF},TSE=${TSE=0}")

epicsEnvSet("EC_SLAVE_NUM",    "8")
epicsEnvSet("EC_HWTYPE",       "EL9410")
dbLoadTemplate("./db/${EC_HWTYPE}.substitutions","P=${PREFIX},PORT=${ADS_ASYN_PORT},ADDR=0,TIMEOUT=1,ADSPORT=${ADSPORT_DEF},MASTER_ID=${EC_MASTER_ID},SLAVE_POS=${EC_SLAVE_NUM},HWTYPE=${EC_HWTYPE},T_SMP_MS=${SAMPLE_RATE_MS_DEF},TSE=${TSE=0}")

epicsEnvSet("EC_SLAVE_NUM",    "9")
epicsEnvSet("EC_HWTYPE",       "EL1252")
dbLoadTemplate("./db/${EC_HWTYPE}.substitutions","P=${PREFIX},PORT=${ADS_ASYN_PORT},ADDR=0,TIMEOUT=1,ADSPORT=${ADSPORT_DEF},MASTER_ID=${EC_MASTER_ID},SLAVE_POS=${EC_SLAVE_NUM},HWTYPE=${EC_HWTYPE},T_SMP_MS=${SAMPLE_RATE_MS_DEF},TSE=${TSE=0}")

epicsEnvSet("EC_SLAVE_NUM",    "10")
epicsEnvSet("EC_HWTYPE",       "EL7201")
dbLoadTemplate("./db/${EC_HWTYPE}.substitutions","P=${PREFIX},PORT=${ADS_ASYN_PORT},ADDR=0,TIMEOUT=1,ADSPORT=${ADSPORT_DEF},MASTER_ID=${EC_MASTER_ID},SLAVE_POS=${EC_SLAVE_NUM},HWTYPE=${EC_HWTYPE},T_SMP_MS=${SAMPLE_RATE_MS_DEF},TSE=${TSE=0}")

epicsEnvSet("EC_SLAVE_NUM",    "11")
epicsEnvSet("EC_HWTYPE",       "EL7201")
dbLoadTemplate("./db/${EC_HWTYPE}.substitutions","P=${PREFIX},PORT=${ADS_ASYN_PORT},ADDR=0,TIMEOUT=1,ADSPORT=${ADSPORT_DEF},MASTER_ID=${EC_MASTER_ID},SLAVE_POS=${EC_SLAVE_NUM},HWTYPE=${EC_HWTYPE},T_SMP_MS=${SAMPLE_RATE_MS_DEF},TSE=${TSE=0}")

epicsEnvSet("EC_SLAVE_NUM",    "12")
epicsEnvSet("EC_HWTYPE",       "EL7201")
dbLoadTemplate("./db/${EC_HWTYPE}.substitutions","P=${PREFIX},PORT=${ADS_ASYN_PORT},ADDR=0,TIMEOUT=1,ADSPORT=${ADSPORT_DEF},MASTER_ID=${EC_MASTER_ID},SLAVE_POS=${EC_SLAVE_NUM},HWTYPE=${EC_HWTYPE},T_SMP_MS=${SAMPLE_RATE_MS_DEF},TSE=${TSE=0}")

epicsEnvSet("EC_SLAVE_NUM",    "13")
epicsEnvSet("EC_HWTYPE",       "EL3214")
dbLoadTemplate("./db/${EC_HWTYPE}.substitutions","P=${PREFIX},PORT=${ADS_ASYN_PORT},ADDR=0,TIMEOUT=1,ADSPORT=${ADSPORT_DEF},MASTER_ID=${EC_MASTER_ID},SLAVE_POS=${EC_SLAVE_NUM},HWTYPE=${EC_HWTYPE},T_SMP_MS=${SAMPLE_RATE_MS_DEF},TSE=${TSE=0}")

epicsEnvSet("EC_SLAVE_NUM",    "14")
epicsEnvSet("EC_HWTYPE",       "EL5021")
dbLoadTemplate("./db/${EC_HWTYPE}.substitutions","P=${PREFIX},PORT=${ADS_ASYN_PORT},ADDR=0,TIMEOUT=1,ADSPORT=${ADSPORT_DEF},MASTER_ID=${EC_MASTER_ID},SLAVE_POS=${EC_SLAVE_NUM},HWTYPE=${EC_HWTYPE},T_SMP_MS=${SAMPLE_RATE_MS_DEF},TSE=${TSE=0}")


epicsEnvSet("EC_SLAVE_NUM",    "15")
epicsEnvSet("EC_HWTYPE",       "EL6695")
dbLoadTemplate("./db/${EC_HWTYPE}.substitutions","P=${PREFIX},PORT=${ADS_ASYN_PORT},ADDR=0,TIMEOUT=1,ADSPORT=${ADSPORT_DEF},MASTER_ID=${EC_MASTER_ID},SLAVE_POS=${EC_SLAVE_NUM},HWTYPE=${EC_HWTYPE},T_SMP_MS=${SAMPLE_RATE_MS_DEF},TSE=${TSE=0}")

epicsEnvSet("EC_SLAVE_NUM",    "16")
epicsEnvSet("EC_HWTYPE",       "EL9410")
dbLoadTemplate("./db/${EC_HWTYPE}.substitutions","P=${PREFIX},PORT=${ADS_ASYN_PORT},ADDR=0,TIMEOUT=1,ADSPORT=${ADSPORT_DEF},MASTER_ID=${EC_MASTER_ID},SLAVE_POS=${EC_SLAVE_NUM},HWTYPE=${EC_HWTYPE},T_SMP_MS=${SAMPLE_RATE_MS_DEF},TSE=${TSE=0}")

epicsEnvSet("EC_SLAVE_NUM",    "17")
epicsEnvSet("EC_HWTYPE",       "EL2032")
dbLoadTemplate("./db/${EC_HWTYPE}.substitutions","P=${PREFIX},PORT=${ADS_ASYN_PORT},ADDR=0,TIMEOUT=1,ADSPORT=${ADSPORT_DEF},MASTER_ID=${EC_MASTER_ID},SLAVE_POS=${EC_SLAVE_NUM},HWTYPE=${EC_HWTYPE},T_SMP_MS=${SAMPLE_RATE_MS_DEF},TSE=${TSE=0}")

epicsEnvSet("EC_SLAVE_NUM",    "18")
epicsEnvSet("EC_HWTYPE",       "EK1110")
dbLoadTemplate("./db/${EC_HWTYPE}.substitutions","P=${PREFIX},PORT=${ADS_ASYN_PORT},ADDR=0,TIMEOUT=1,ADSPORT=${ADSPORT_DEF},MASTER_ID=${EC_MASTER_ID},SLAVE_POS=${EC_SLAVE_NUM},HWTYPE=${EC_HWTYPE},T_SMP_MS=${SAMPLE_RATE_MS_DEF},TSE=${TSE=0}")

epicsEnvSet("EC_SLAVE_NUM",    "19")
epicsEnvSet("EC_HWTYPE",       "indraDrive")
dbLoadTemplate("./db/${EC_HWTYPE}.substitutions","P=${PREFIX},PORT=${ADS_ASYN_PORT},ADDR=0,TIMEOUT=1,ADSPORT=${ADSPORT_DEF},MASTER_ID=${EC_MASTER_ID},SLAVE_POS=${EC_SLAVE_NUM},HWTYPE=${EC_HWTYPE},T_SMP_MS=${SAMPLE_RATE_MS_DEF},TSE=${TSE=0}")

epicsEnvSet("EC_SLAVE_NUM",    "20")
epicsEnvSet("EC_HWTYPE",       "IPOS8020")
dbLoadTemplate("./db/${EC_HWTYPE}.substitutions","P=${PREFIX},PORT=${ADS_ASYN_PORT},ADDR=0,TIMEOUT=1,ADSPORT=${ADSPORT_DEF},MASTER_ID=${EC_MASTER_ID},SLAVE_POS=${EC_SLAVE_NUM},HWTYPE=${EC_HWTYPE},T_SMP_MS=${SAMPLE_RATE_MS_DEF},TSE=${TSE=0}")

epicsEnvSet("EC_SLAVE_NUM",    "21")
epicsEnvSet("EC_HWTYPE",       "IPOS8020")
dbLoadTemplate("./db/${EC_HWTYPE}.substitutions","P=${PREFIX},PORT=${ADS_ASYN_PORT},ADDR=0,TIMEOUT=1,ADSPORT=${ADSPORT_DEF},MASTER_ID=${EC_MASTER_ID},SLAVE_POS=${EC_SLAVE_NUM},HWTYPE=${EC_HWTYPE},T_SMP_MS=${SAMPLE_RATE_MS_DEF},TSE=${TSE=0}")

epicsEnvSet("EC_SLAVE_NUM",    "22")
epicsEnvSet("EC_HWTYPE",       "IPOS8020")
dbLoadTemplate("./db/${EC_HWTYPE}.substitutions","P=${PREFIX},PORT=${ADS_ASYN_PORT},ADDR=0,TIMEOUT=1,ADSPORT=${ADSPORT_DEF},MASTER_ID=${EC_MASTER_ID},SLAVE_POS=${EC_SLAVE_NUM},HWTYPE=${EC_HWTYPE},T_SMP_MS=${SAMPLE_RATE_MS_DEF},TSE=${TSE=0}")


#dbLoadRecords("./db/test.db","P=${PREFIX},PORT=${ADS_ASYN_PORT}")

##############################################################################
############# Usefull commands
#var streamDebug 1
#asynReport(2,"${ADS_ASYN_PORT}")
#asynSetTraceMask("${ADS_ASYN_PORT}", -1, 0xFF)
iocInit()
