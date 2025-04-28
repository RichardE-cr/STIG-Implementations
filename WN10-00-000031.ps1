<#
.SYNOPSIS
    This PowerShell script configures BitLocker policy settings to require PIN authentication at startup, enforcing compliance with STIG WN10-00-000031.

.NOTES
    Author          : Richard Edwards 
    LinkedIn        : linkedin.com/in/richard-demetrius-edwards
    GitHub          : github.com/RichardE-cr
    Date Created    : 2025-04-27
    Last Modified   : 2024-04-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000031

.TESTED ON
    Date(s) Tested  : 2025-04-27
    Tested By       : Richard Edwards
    Systems Tested  : Windows 10 Pro
    PowerShell Ver. : 5.1.19041.5737    

.USAGE
    Run the WN10-00-000031.ps1 script with default settings
#>

# Define the registry base path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"

# Create the path if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set required values
New-ItemProperty -Path $regPath -Name "UseAdvancedStartup" -PropertyType DWord -Value 1 -Force
New-ItemProperty -Path $regPath -Name "UseTPMPIN" -PropertyType DWord -Value 1 -Force
New-ItemProperty -Path $regPath -Name "UseTPMKeyPIN" -PropertyType DWord -Value 1 -Force 
