<#
.SYNOPSIS
    Ensures users are prompted for a password when resuming from sleep on battery power.

.NOTES
    Author          : Richard Edwards
    LinkedIn        : linkedin.com/in/richard-demetrius-edwards
    GitHub          : github.com/RichardE-cr
    Date Created    : 2025-06-24
    Version         : 1.0
    STIG-ID         : WN10-CC-000145

.TESTED ON
    Systems Tested  : Windows 10 Pro
    PowerShell Ver. : 5.1.19041.5737

.USAGE
    Run this script as Administrator to enforce password on wake (battery mode).
#>

# Set the value to require password on wake while on battery
powercfg /SETDCVALUEINDEX SCHEME_CURRENT SUB_NONE CONSOLELOCK 1

# Apply the updated power scheme
powercfg /SETACTIVE SCHEME_CURRENT

Write-Output "STIG WN10-CC-000145 applied: Password prompt on resume (battery mode) is now enabled."
