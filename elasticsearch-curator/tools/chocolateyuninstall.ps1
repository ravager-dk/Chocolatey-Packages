$ErrorActionPreference = 'Stop'

# Refresh environment to ensure Python is available
Update-SessionEnvironment

# Find the latest available Python version
Write-Host "Uninstalling curator CLI..."
$pythonExe = (py --list-paths 2>$null | Select-Object -First 1 | ForEach-Object { $_ -replace '.*\s+(.*)$', '$1' })

if ($pythonExe) {
    & $pythonExe -m pip uninstall curator -y | Out-Null
}

# Clean up extracted source files
Get-ChildItem "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" | Where-Object { $_.Extension -ne '.ps1' } | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue

Write-Host "Curator CLI successfully uninstalled"

