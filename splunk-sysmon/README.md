This directory contains files for starting a windows sandbox VM that installs the splunk universal forwarder and sysmon with Swift on Security's sysmon config (See https://github.com/SwiftOnSecurity/sysmon-config) as well as enable Powershell logging.
The splunk forwarder is configured to forward the powershell logs and sysmon logs to your splunk instance.

You will need to configure the following:
install-logging.cmd: 
    Line 2: The splunk forwarder msi filename. 
    Line 2: RECEIVING_INDEXER= to point to your splunk instance.
    Line 16 with sysmon64.exe if you use a different sysmon config.
sysmon-ps-logging-splunk.wsb:
    Line 4: The HostFolder configuration item. This is the ReadOnly shared folder inside the VM.  If you check out this repo to this directory, it should Just Work.
    
