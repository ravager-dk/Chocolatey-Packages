$ErrorActionPreference = 'Stop'

# Find Python 3.10+ installation
# Look for Python installations in multiple locations
$searchPaths = @('C:\Python*', 'C:\hostedtoolcache\windows\Python\*')
$pythonExe = $null

foreach ($searchPath in $searchPaths) {
    $pythonDirs = Get-ChildItem -Path $searchPath -Directory -ErrorAction SilentlyContinue | 
        Sort-Object Name -Descending
    
    foreach ($dir in $pythonDirs) {
        # Check root of directory
        $pythonPath = Join-Path $dir.FullName 'python.exe'
        if (Test-Path $pythonPath) {
            $version = & $pythonPath --version 2>&1
            if ($version -match 'Python 3\.(\d+)' -and [int]$matches[1] -ge 10) {
                $pythonExe = $pythonPath
                Write-Host "Found Python: $version at $pythonPath"
                break
            }
        }
        
        # Check x64 subdirectory (common for hostedtoolcache)
        $x64Path = Join-Path $dir.FullName 'x64' | Join-Path -ChildPath 'python.exe'
        if (Test-Path $x64Path) {
            $version = & $x64Path --version 2>&1
            if ($version -match 'Python 3\.(\d+)' -and [int]$matches[1] -ge 10) {
                $pythonExe = $x64Path
                Write-Host "Found Python: $version at $x64Path"
                break
            }
        }
    }
    
    if ($null -ne $pythonExe) { break }
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

