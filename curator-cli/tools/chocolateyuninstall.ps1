$ErrorActionPreference = 'Stop'

# Uninstall curator from pip
Write-Host "Uninstalling curator CLI..."
& python -m pip uninstall curator -y | Out-Null

# Clean up extracted source files
Get-ChildItem "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" | Where-Object { $_.Extension -ne '.ps1' } | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue

Write-Host "Curator CLI successfully uninstalled"

