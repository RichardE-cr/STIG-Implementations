<#
.SYNOPSIS
    Sets the account lockout duration to 15 minutes to meet STIG compliance.

.NOTES
    Author          : Richard Edwards
    LinkedIn        : linkedin.com/in/richard-demetrius-edwards
    GitHub          : github.com/RichardE-cr
    Date Created    : 2025-06-24
    Version         : 1.0
    STIG-ID         : WN10-AC-000005

.TESTED ON
    Systems Tested  : Windows 10 Pro
    PowerShell Ver. : 5.1.19041.5737

.USAGE
    Run this script as Administrator to configure lockout duration.
#>

# Set Account Lockout Duration to 15 minutes
net accounts /lockoutduration:15

Write-Output "STIG WN10-AC-000005 applied: Account lockout duration set to 15 minutes."
