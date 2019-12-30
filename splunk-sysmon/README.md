This directory contains files for starting a windows sandbox VM that installs the splunk universal forwarder and sysmon with Swift on Security's sysmon config (See https://github.com/SwiftOnSecurity/sysmon-config) as well as enable Powershell logging.
The splunk forwarder is configured to forward the powershell logs and sysmon logs to your splunk instance.

Download sysmon and extract it to c:\sandbox\splunk-sysmon\

Download the windows 64bit universal forwarder and copy the installer to c:\sandbox\splunk-sysmon\ , making sure to update the filename in the install-logging.cmd file.


You will need to configure the following:
```
install-logging.cmd: 
    Line 2: The splunk forwarder msi filename. 
    Line 2: RECEIVING_INDEXER= to point to your splunk instance. (Note that in order to parse/decode windows event logs, your splunk server may need to be running on windows? It's unclear if this is still a requirement for the splunk indexer to parse Windows Event Logs)
    Line 16 with sysmon64.exe if you use a different sysmon config.
sysmon-ps-logging-splunk.wsb:
    Line 4: The HostFolder configuration item. This is the ReadOnly shared folder inside the VM.  If you copy this repo directly to this directory (C:\Sandbox\, not C:\Sandbox\Windows-Sandbox-Configs\), it should Just Work.
    
