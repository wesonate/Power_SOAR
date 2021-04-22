<#
 .SYNOPSIS
 Power_SOAR - Security Orchestration, Automation and Response (SOAR) project built around PowerShell
 https://github.com/wesonate/Power_SOAR

 .DESCRIPTION
 POWER_SOAR is an Information Security Orchestration, Automation and Response (SOAR) project built around PowerShell and Microsoft Power Automate.
 When paired with the  Power Automate mobile app, security teams can execute powerful incident response actions with the click of a button from any mobile device.
 

 .PARAMETER

 .EXAMPLE

 .NOTES
 Start the script "Flow.ps1", execute an on-demand action from the MS Power Automate app.
 New actions will be added as PowerShell functions within the "Power_SOAR Actions" area below.
 See documentation for full details.
  
#>

#------------------------------#
#Setup Environment Requirements#
#------------------------------#
$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = “c:\Power_SOAR\flow” #Local directory to monitor for incoming .TXT files
$watcher.Filter = “*.txt” #TXT files only
$watcher.IncludeSubdirectories = $false
$watcher.EnableRaisingEvents = $true

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12  #Use TLS 1.2
Set-Location -Path "C:\Power_SOAR\Flow" #Set default working directory
Remove-Item -Path "c:\Power_SOAR\Flow\*" -Confirm:$false -Force #Clear working directory

$actionCreated = {
$path = $Event.SourceEventArgs.FullPath
$name = $Event.SourceEventArgs.Name
$changeType = $Event.SourceEventArgs.ChangeType
$timeStamp = $Event.TimeGenerated
#------------------------#
#Begin Power_SOAR Actions#
#------------------------#
#
#
    Try {  #Start Workflow with Error Checking

    #Name: On-Demand - Run Calculator
    #Description: Example on demand action - run calc.exe
        function calculator.txt {
        $pathContents = Get-Content $path;Remove-Item $path -Confirm:$false -Force #Read contents and clear
        $global:Output = "On-Demand - Run Calculator"

        #Action
        start-process calc.exe
    } #End Function
#
#
#------------------------#
# End Power_SOAR Actions #
#------------------------#



#Execute Power_SOAR Task
if([System.IO.File]::Exists($path)){
    #write-host file found on disk: $path,$name
    &"$name" $path
} #End Task Function



# Begin Cleanup Tasks
    #Log Flow Execution To file
    out-file -FilePath "c:\Power_SOAR\flow.log" -InputObject "SUCCESS: $global:Output $(Get-Date -Format u)" -Encoding ascii -Append
    write-host "SUCCESS: $global:Output $(Get-Date -Format u)"

    #Clear Variables
    $path = ""
    $pathContents = ""
    $global:Output = ""

    #Error Checking
        }
    Catch {
    #Error Occured
    #Log Flow Execution To file
    out-file -FilePath "d:\logs\flow.log" -InputObject "ERROR: $global:Output $(Get-Date -Format u)" -Encoding ascii -Append
    write-host "ERROR: $global:Output $(Get-Date -Format u)"

    #Clear Variables
    $path = ""
    $pathContents = ""
    $global:Output = ""

        } #End Error Checking
    

# End Cleanup Tasks



# Check for new actions every 2 seconds
}
Register-ObjectEvent $watcher “Created” -Action $actionCreated
while ($true) {sleep 2}