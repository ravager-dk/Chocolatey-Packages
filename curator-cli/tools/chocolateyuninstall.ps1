$ErrorActionPreference = 'Stop'

# Find Python 3.10+ installation
# Look for Python installations in C:\Python* directories
$pythonExe = $null
$pythonDirs = Get-ChildItem -Path 'C:\Python*' -Directory -ErrorAction SilentlyContinue | 
    Where-Object { $_.Name -match 'Python3\.\d+' } | 
    Sort-Object Name -Descending

foreach ($dir in $pythonDirs) {
    $pythonPath = Join-Path $dir.FullName 'python.exe'
    if (Test-Path $pythonPath) {
        # Check if version is 3.10 or higher
        $version = & $pythonPath --version 2>&1
        if ($version -match 'Python 3\.(\d+)' -and [int]$matches[1] -ge 10) {
            $pythonExe = $pythonPath
            Write-Host "Found Python: $version at $pythonPath"
            break
        }
    }
}

# Fallback to python command if not found
if ($null -eq $pythonExe) {
    Write-Host "Python 3.10+ not found in standard locations, using system Python"
    $pythonExe = 'python'
}

# Uninstall curator from pip
Write-Host "Uninstalling curator CLI using: $pythonExe"
& $pythonExe -m pip uninstall curator -y | Out-Null

# Clean up extracted source files
Get-ChildItem "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" | Where-Object { $_.Extension -ne '.ps1' } | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue

Write-Host "Curator CLI successfully uninstalled"

