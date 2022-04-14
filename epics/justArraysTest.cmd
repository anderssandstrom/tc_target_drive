require ads,2.0.2

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

epicsEnvSet("ADS_ASYN_PORT",      "TARGET_ADS_PORT_ARRAY")
epicsEnvSet("PREFIX",             "TARGET_DU_ARRAY:")
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

## test arrays
dbLoadRecords("./db/testArrays.db","P=${PREFIX},PORT=${ADS_ASYN_PORT},INDEX=01,NELM=200")
dbLoadRecords("./db/testArrays.db","P=${PREFIX},PORT=${ADS_ASYN_PORT},INDEX=02,NELM=200")
dbLoadRecords("./db/testArrays.db","P=${PREFIX},PORT=${ADS_ASYN_PORT},INDEX=03,NELM=200")
dbLoadRecords("./db/testArrays.db","P=${PREFIX},PORT=${ADS_ASYN_PORT},INDEX=04,NELM=200")
dbLoadRecords("./db/testArrays.db","P=${PREFIX},PORT=${ADS_ASYN_PORT},INDEX=05,NELM=200")
dbLoadRecords("./db/testArrays.db","P=${PREFIX},PORT=${ADS_ASYN_PORT},INDEX=06,NELM=200")
dbLoadRecords("./db/testArrays.db","P=${PREFIX},PORT=${ADS_ASYN_PORT},INDEX=07,NELM=200")
dbLoadRecords("./db/testArrays.db","P=${PREFIX},PORT=${ADS_ASYN_PORT},INDEX=08,NELM=200")

##############################################################################
############# Usefull commands
#var streamDebug 1
#asynReport(2,"${ADS_ASYN_PORT}")
#asynSetTraceMask("${ADS_ASYN_PORT}", -1, 0xFF)
iocInit()
