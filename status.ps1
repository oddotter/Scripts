$HOSTNAME = (Get-WMIObject Win32_ComputerSystem| Select-Object -ExpandProperty Name)
$OS = ((Get-WMIObject win32_operatingsystem).name)
$CPU = (Get-WmiObject -Class Win32_Processor -ComputerName. | Select-Object Name)
$SERIAL = (Get-WmiObject win32_bios | select Serialnumber)
$FREESPACE = (Get-CimInstance -Class Win32_LogicalDisk | 
  Select-Object -First 1 -Property Name, @{
    label='FreeSpace'
    expression={($_.FreeSpace/1GB).ToString('F2')}
  })
$MCAFEE = (Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall | Get-ItemProperty | Where-Object {$_.DisplayName -like "Mcafee*" } | Select-Object -Last 2 -Property DisplayName, DisplayVersion | Select -Index 0)
New-Item -Path "c:\" -Name "STATUS" -ItemType "directory"
cd C:\STATUS
New-Item -Path "c:\STATUS" -Name "$HOSTNAME.txt" -ItemType "file"
echo "HOSTNAME=$HOSTNAME" >> "C:\STATUS\$HOSTNAME.txt"
echo "OS=$OS" >> "C:\STATUS\$HOSTNAME.txt"
echo "SERIAL=$SERIAL" >> "C:\STATUS\$HOSTNAME.txt"
echo "FREESPACE=$FREESPACE" >> "C:\STATUS\$HOSTNAME.txt"
echo "MCAFEE=$MCAFEE" >> "C:\STATUS\$HOSTNAME.txt"
