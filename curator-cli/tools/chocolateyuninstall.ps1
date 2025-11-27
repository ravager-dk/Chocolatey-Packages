$ErrorActionPreference = 'Stop'

# Refresh environment to ensure Python is available
Update-SessionEnvironment

# Use Windows py.exe launcher to find and use Python 3.10+
Write-Host "Uninstalling curator CLI..."
& py -3.10+ -m pip uninstall curator -y | Out-Null

# Clean up extracted source files
Get-ChildItem "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" | Where-Object { $_.Extension -ne '.ps1' } | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue

Write-Host "Curator CLI successfully uninstalled"

