xcopy /E C:\Users\WDAGUtilityAccount\Desktop\Sandbox\splunkforwarder\* C:\Users\WDAGUtilityAccount\downloads\   
C:\Users\WDAGUtilityAccount\Downloads\splunkforwarder-8.0.1-6db836e2fb9e-x64-release.msi AGREETOLICENSE=yes RECEIVING_INDEXER="192.168.2.44:9997"	 /quiet WINEVENTLOG_APP_ENABLE=1 WINEVENTLOG_SEC_ENABLE=1 WINEVENTLOG_SYS_ENABLE=1 WINEVENTLOG_FWD_ENABLE=0
mkdir "C:\Users\WDAGUtilityAccount\Documents\powershell-logs"
copy C:\Users\WDAGUtilityAccount\downloads\inputs.conf "C:\Program Files\SplunkUniversalForwarder\etc\system\local"
powershell.exe New-Item -Path HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\
powershell.exe New-Item -Path HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\ModuleLogging\
powershell.exe New-ItemProperty -Path HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\ModuleLogging\ -name ModuleNames -value "*" -PropertyType MULTISTRING
powershell.exe New-ItemProperty -Path HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\ModuleLogging\ -name EnableModuleLogging -Value "1" -PropertyType DWORD
powershell.exe New-Item -Path HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging
powershell.exe New-ItemProperty -Path HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging\ -name EnableScriptBlockLogging -value "1" -PropertyType DWORD
powershell.exe New-Item -Path HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\Transcription
powershell.exe New-ItemProperty -Path HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\Transcription\ -name OutputDirectory -PropertyType STRING -value "C:\Users\WDAGUtilityAccount\Documents\powershell-logs\\"
powershell.exe New-ItemProperty -Path HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\Transcription\ -name EnableTranscripting -value "1" -PropertyType DWORD
powershell.exe New-ItemProperty -Path HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\Transcription\ -name EnableInvocationHeader -value "1"  -PropertyType DWORD

powershell.exe  restart-service -name SplunkForwarder
