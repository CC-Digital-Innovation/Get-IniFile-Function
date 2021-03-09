#requires -version 2
<#
.SYNOPSIS
  Example program that calls Get-IniFile-Function.ps1
.DESCRIPTION
  Example file that calles Get-IniFile-Function.ps1 to read and parse config parameters form ini file
.INPUTS
  ini file
.OUTPUTS
  stdout
.NOTES
  Version:        0.1
  Author:         Rich Bocchinfuso
  Creation Date:  3/6/2021
  Purpose/Change: Example script to assist with accessing ini file config parameters so that PowerShell scripts can be refactored and all variables placed in ini files
  
#>

#---------------------------------------[Declarations]------------------------------------

#Script Version
$sScriptVersion = "0.1"

#---------------------------------------[Initialisations]----------------------------------

# Set Error Action to Silently Continue
$ErrorActionPreference = "SilentlyContinue"

# Dot Source required Function Libraries
. ".\Get-IniFile-Function.ps1"


#---------------------------------------[Functions]---------------------------------------


#---------------------------------------[Execution]---------------------------------------

# Get config parameters from config.ini
$configIni = Get-IniFile .\config.ini

# Output file path and names from [io] section of cognif.ini
$LogFile = $configIni.Locations.LogFile
$OutputFile = $configIni.Locations.OutputFile
Write-Host 'Log File from ini file is: ' $LogFile
Write-Host 'Output file from ini file is: ' $OutputFile

# Output Username and Password from [creds] section of cognif.ini
$Username = $configIni.Creds.Username
$Password = $configIni.Creds.Password
Write-Host 'Username from ini file is: ' $Username
Write-Host 'Password from ini file is: ' $Password

# Output server and port from [system] section of cognif.ini
$IP = $configIni.System.IP
$port = $configIni.System.Port
Write-Host 'System IP from ini file is: ' $IP
Write-Host 'System port from ini file is: ' $Port

# Output server and port from [system] section of cognif.ini
$WaitForTime = $configIni.Other.WaitForTime
$VerboseLogging = $configIni.Other.VerboseLogging
Write-Host 'WaitForTime setting from ini file is: ' $WaitForTime
Write-Host 'VerboseLogging setting from ini file is: ' $VerboseLogging
