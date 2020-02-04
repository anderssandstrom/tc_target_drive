require ads,dev

##############################################################################
############# Configure ads device driver:
# 1.  Asyn port name                         :  "TARGET_ADS"
# 2.  IP                                     :  "192.168.88.200"
# 3.  AMS of plc                             :  "5.46.8.38.1.1"
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

adsAsynPortDriverConfigure("${ADS_ASYN_PORT}","192.168.88.122","192.168.88.122.1.1",${ADSPORT_DEF},1000,0,0,${SAMPLE_RATE_MS_DEF},${MAX_DLY_MS_DEF},1000,0)

asynOctetSetOutputEos("${ADS_ASYN_PORT}", -1, "\n")
asynOctetSetInputEos("${ADS_ASYN_PORT}", -1, "\n")
asynSetTraceMask("${ADS_ASYN_PORT}", -1, 0x41)

##############################################################################
############# Load records
dbLoadRecords("./db/target.db","P=${PREFIX},PORT=${ADS_ASYN_PORT}")
dbLoadRecords("./db/indraDriveStatus.db","P=${PREFIX},PORT=${ADS_ASYN_PORT}")
dbLoadRecords("./db/indraDriveCommand.db","P=${PREFIX},PORT=${ADS_ASYN_PORT}")
dbLoadRecords("./db/brake.db","P=${PREFIX},PORT=${ADS_ASYN_PORT}")
dbLoadRecords("./db/home.db","P=${PREFIX},PORT=${ADS_ASYN_PORT}")

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

##############################################################################
############# Usefull commands
#var streamDebug 1
#asynReport(2,"${ADS_ASYN_PORT}")
#asynSetTraceMask("${ADS_ASYN_PORT}", -1, 0xFF)
iocInit
