<#
.SYNOPSIS
    This PowerShell script creates or updates a registry setting to disable the camera on the Windows lock screen for security compliance.

.NOTES
    Author          : Richard Edwards 
    LinkedIn        : linkedin.com/in/richard-demetrius-edwards
    GitHub          : github.com/RichardE-cr
    Date Created    : 2025-04-27
    Last Modified   : 2025-04-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000005

.TESTED ON
    Date(s) Tested  : 2025-04-27
    Tested By       : Richard Edwards
    Systems Tested  : Windows 10 Pro
    PowerShell Ver. : 5.1.19041.5737    

.USAGE
    Run the WN10-CC-000005.ps1 script with default settings
#>

 # Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"

# Check if the path exists, if not, create it
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set the NoLockScreenCamera value to 1
New-ItemProperty -Path $regPath -Name "NoLockScreenCamera" -PropertyType DWord -Value 1 -Force
 
