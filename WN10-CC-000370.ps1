<#
.SYNOPSIS
    This PowerShell script disables the ability for domain accounts to log on using a PIN by setting the AllowDomainPINLogon registry value to 0.

.NOTES
    Author          : Richard Edwards 
    LinkedIn        : linkedin.com/in/richard-demetrius-edwards
    GitHub          : github.com/RichardE-cr
    Date Created    : 2025-04-27
    Last Modified   : 2025-04-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000370

.TESTED ON
    Date(s) Tested  : 2025-04-27
    Tested By       : Richard Edwards
    Systems Tested  : Windows 10 Pro
    PowerShell Ver. : 5.1.19041.5737    

.USAGE
    Run the WN10-CC-000370.ps1 script with default settings
    Must be run as Administrator
#>

# Define the registry path
$regPath = "HKLM:\Software\Policies\Microsoft\Windows\System"

# Create the path if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set AllowDomainPINLogon to 0 (disable domain PIN logon)
New-ItemProperty -Path $regPath -Name "AllowDomainPINLogon" -PropertyType DWord -Value 0 -Force
 
