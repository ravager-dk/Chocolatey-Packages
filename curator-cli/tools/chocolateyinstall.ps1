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

# Refresh environment to pick up Python installation
Update-SessionEnvironment

# Use Windows py.exe launcher to find and use Python 3.10+
Write-Host "Installing curator from source..."
& py -3.10+ -m pip install $sourceDir

if ($LASTEXITCODE -ne 0) {
    throw "Failed to install curator CLI"
}

Write-Host "Curator CLI successfully installed"
