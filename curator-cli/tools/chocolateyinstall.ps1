$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$sourceDir = Join-Path $toolsDir "curator-9.0.0"

$packageArgs = @{
    PackageName    = 'curator-cli'
    FileType       = 'zip'
    Url            = 'https://github.com/elastic/curator/archive/refs/tags/v9.0.0.zip'
    ChecksumType   = 'sha256'
    Checksum       = '5cfecfa4b779df27c6887044c8b4a5d864e957689dc60803a8ad1e37196cfad1'
    UnzipLocation  = $toolsDir
}

# Extract the source
Install-ChocolateyZipPackage @packageArgs

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

# Install curator via pip from the extracted source
Write-Host "Installing curator from source with: $pythonExe"
& $pythonExe -m pip install --upgrade pip setuptools wheel | Out-Null
& $pythonExe -m pip install $sourceDir

if ($LASTEXITCODE -ne 0) {
    throw "Failed to install curator CLI"
}

Write-Host "Curator CLI successfully installed"
