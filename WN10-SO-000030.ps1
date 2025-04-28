<#
.SYNOPSIS
    This PowerShell script ensures only advanced audit policies are applied by setting SCENoApplyLegacyAuditPolicy to 1 in the registry.

.NOTES
    Author          : Richard Edwards 
    LinkedIn        : linkedin.com/in/richard-demetrius-edwards
    GitHub          : github.com/RichardE-cr
    Date Created    : 2025-04-27
    Last Modified   : 2025-04-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000030

.TESTED ON
    Date(s) Tested  : 2025-04-27
    Tested By       : Richard Edwards
    Systems Tested  : Windows 10 Pro
    PowerShell Ver. : 5.1.19041.5737    

.USAGE
    Run the WN10-SO-000030.ps1 script with default settings
#>

# WN10-SO-000030 - Enforce Advanced Audit Policies
# Must be run as Administrator

# Define the registry path
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa"

# Create the path if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set SCENoApplyLegacyAuditPolicy to 1 (force use of advanced audit policy)
New-ItemProperty -Path $regPath -Name "SCENoApplyLegacyAuditPolicy" -PropertyType DWord -Value 1 -Force
