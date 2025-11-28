$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$sourceDir = Join-Path $toolsDir "curator-9.0.0"

$packageArgs = @{
    PackageName    = 'elasticsearch-curator'
    FileType       = 'zip'
    Url            = 'https://github.com/elastic/curator/archive/refs/tags/v9.0.0.zip'
    ChecksumType   = 'sha256'
    Checksum       = '5cfecfa4b779df27c6887044c8b4a5d864e957689dc60803a8ad1e37196cfad1'
    UnzipLocation  = $toolsDir
}

# Extract the source
Install-ChocolateyZipPackage @packageArgs

# Refresh environment to pick up Python installation
Update-SessionEnvironment

# Find the latest available Python version
Write-Host "Installing curator from source..."
$pythonExe = (py --list-paths 2>$null | Select-Object -First 1 | ForEach-Object { $_ -replace '.*\s+(.*)$', '$1' })

if (-not $pythonExe) {
    throw "No Python installation found"
}

& $pythonExe -m pip install $sourceDir

if ($LASTEXITCODE -ne 0) {
    throw "Failed to install curator CLI"
}

Write-Host "Curator CLI successfully installed"
