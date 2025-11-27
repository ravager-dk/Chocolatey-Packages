$ErrorActionPreference = 'Stop'

# Find Python 3.10 from the dependency
$python310Paths = @(
    'C:\Python310\python.exe',
    'C:\Python310.0\python.exe',
    'C:\Python\python310\python.exe'
)

$pythonExe = $null
foreach ($path in $python310Paths) {
    if (Test-Path $path) {
        $pythonExe = $path
        break
    }
}

# Fallback to python command if not found
if ($null -eq $pythonExe) {
    $pythonExe = 'python'
}

# Uninstall curator from pip
Write-Host "Uninstalling curator CLI..."
& $pythonExe -m pip uninstall curator -y | Out-Null

# Clean up extracted source files
Get-ChildItem "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" | Where-Object { $_.Extension -ne '.ps1' } | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue

Write-Host "Curator CLI successfully uninstalled"

