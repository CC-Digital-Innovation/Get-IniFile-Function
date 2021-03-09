#requires -version 2
<#
.SYNOPSIS
  Fuction to read and parse ini file
.DESCRIPTION
  Function that reads config parameters from config.ini
.INPUTS
  ini file
.NOTES
  Version:        0.1
  Author:         Rich Bocchinfuso
  Creation Date:  3/6/2021
  Purpose/Change: Initial function development to assist in refactoring powershell code
  
#>

#---------------------------------------[Declarations]------------------------------------

#Script Version
$sScriptVersion = "0.1"


#---------------------------------------[Initialisations]----------------------------------

# Set Error Action to Silently Continue
$ErrorActionPreference = "SilentlyContinue"


#---------------------------------------[Functions]---------------------------------------

function Get-IniFile 
{  
    param(  
        [parameter(Mandatory = $true)] [string] $filePath  
    )  
    
    $anonymous = "NoSection"
  
    $ini = @{}  
    switch -regex -file $filePath  
    {  
        "^\[(.+)\]$" # Section  
        {  
            $section = $matches[1]  
            $ini[$section] = @{}  
            $CommentCount = 0  
        }  

        "^(;.*)$" # Comment  
        {  
            if (!($section))  
            {  
                $section = $anonymous  
                $ini[$section] = @{}  
            }  
            $value = $matches[1]  
            $CommentCount = $CommentCount + 1  
            $name = "Comment" + $CommentCount  
            $ini[$section][$name] = $value  
        }   

        "(.+?)\s*=\s*(.*)" # Key  
        {  
            if (!($section))  
            {  
                $section = $anonymous  
                $ini[$section] = @{}  
            }  
            $name,$value = $matches[1..2]  
            $ini[$section][$name] = $value  
        }  
    }  

    return $ini  
}  


#---------------------------------------[Execution]---------------------------------------

# MyProgram.ps calls this function