<#
.SYNOPSIS
    Prevents users from changing installation options using Windows Installer.

.NOTES
    Author          : Richard Edwards
    LinkedIn        : linkedin.com/in/richard-demetrius-edwards
    GitHub          : github.com/RichardE-cr
    Date Created    : 2025-06-24
    Version         : 1.0
    STIG-ID         : WN10-CC-000030

.TESTED ON
    Systems Tested  : Windows 10 Pro
    PowerShell Ver. : 5.1.19041.5737

.USAGE
    Run this script as Administrator to apply the STIG-compliant setting.
#>

# Define registry path
$regPath = "HKLM:\Software\Policies\Microsoft\Windows\Installer"

# Create the registry path if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set the "EnableUserControl" value to 0 to prevent users from changing install options
New-ItemProperty -Path $regPath -Name "EnableUserControl" -PropertyType DWord -Value 0 -Force

Write-Output "STIG WN10-CC-000030 applied: Users are now prevented from changing installation options."
