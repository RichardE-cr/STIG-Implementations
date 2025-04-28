<#
.SYNOPSIS
    This script enables logging of all PowerShell script block activity by setting EnableScriptBlockLogging to 1 in the registry.

.NOTES
    Author          : Richard Edwards 
    LinkedIn        : linkedin.com/in/richard-demetrius-edwards
    GitHub          : github.com/RichardE-cr
    Date Created    : 2025-04-27
    Last Modified   : 2025-04-27
    Version         : 1.5
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000326

.TESTED ON
    Date(s) Tested  : 2025-04-27
    Tested By       : Richard Edwards
    Systems Tested  : Windows 10 Pro
    PowerShell Ver. : 5.1.19041.5737    

.USAGE
    Run the WN10-CC-000326.ps1 script with default settings.
    Must be run as Administrator
#>

# WN10-CC-000326 - Enable PowerShell Script Block Logging


# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging"

# Create the path if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set EnableScriptBlockLogging to 1 (enable logging)
New-ItemProperty -Path $regPath -Name "EnableScriptBlockLogging" -PropertyType DWord -Value 1 -Force
 
