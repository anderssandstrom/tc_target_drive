Connect to targetdrive twincat plc controller (cx5130) at RATS:

Cx-setup:
1. The cx is setup for dhcp
2. The cx firewall is disabled

In mac:
1. Use thunderbolt etherbet adapter (anders sandström), this is regeresitered in csEntry
2. test to ping controller 172.30.2.35
3. diable wifi (maybe not needed)
4. Seems also VPN needs to be off

In virtual machine (windows 10 + twincat)
2. Share the mac ip ("share with my Mac") in wmware
3. test to ping controller 172.30.2.35
4. In twincat when searching for target. Enter ip directly in the searchbox in the top left corner. 172.30.2.35
5. Press top left button, then the target drive plc should appear 
6. Add route (pw = "1")
7. Close dialog
8. Now you should be able to choose the targetdrive plc as "target"

If not work, disable firewall in virtual machine.
