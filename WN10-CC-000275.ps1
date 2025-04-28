<#
.SYNOPSIS
    This PowerShell script disables Client Drive Mapping in RDP Sessions and logs success.

.NOTES
    Author          : Richard Edwards 
    LinkedIn        : linkedin.com/in/richard-demetrius-edwards
    GitHub          : github.com/RichardE-cr
    Date Created    : 2025-04-27
    Last Modified   : 2024-04-27
    Version         : 1.5
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 2025-04-27
    Tested By       : Richard Edwards
    Systems Tested  : Windows 10 Pro
    PowerShell Ver. : 5.1.19041.5737    

.USAGE
    Run the WN10-CC-000275.ps1 script with default settings
#>

# Must be run as Administrator

# Define variables
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
$propertyName = "fDisableCdm"
$desiredValue = 1

# Create the registry path if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set the registry property
New-ItemProperty -Path $regPath -Name $propertyName -PropertyType DWord -Value $desiredValue -Force

# Define event log parameters
$eventSource = "STIGAutomation"
$eventID = 50275
$logName = "Application"
$eventMessage = "STIG WN10-CC-000275 applied: Client drive redirection disabled successfully."

# Create the event source if it doesn't exist
if (-not [System.Diagnostics.EventLog]::SourceExists($eventSource)) {
    New-EventLog -LogName $logName -Source $eventSource
}

# Write an event log entry
Write-EventLog -LogName $logName -Source $eventSource -EntryType Information -EventId $eventID -Message $eventMessage
