## File includes notes and findings regarding FAT/SAT/commissioning of target drive cabinet

### Notes on electrical connections
Item | Drawings OK | Description
--- | --- | --- | 
1 | Yes | Moved EtherCAT bus from EL6695 to EK1110. Cable slightly to short
2 | Yes | Moved EtherCAT bus from EK1100 output to input.
3 | Needs update | EtherCAT bus connected wrong on Technosoft drives. The Technosoft drives have EtherCAT input as lower connector and output as upper (not like Beckhoff). So to conclude just switch upper to lower EtherCAT connectors.
4 | Yes | Slave 2 channel 8 connection wrong. (Ups fuses OK). Change of "helper contact" mode, then OK.

### Observations that need futher investigation
Item | Solved | Description
--- | --- | --- | 
1 | No | The two EL2819 reports invalid data. Why?

