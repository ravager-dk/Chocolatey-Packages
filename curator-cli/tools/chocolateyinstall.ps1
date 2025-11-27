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

Write-Host "Using Python from: $pythonExe"

# Install curator via pip from the extracted source
Write-Host "Installing curator from source..."
& $pythonExe -m pip install --upgrade pip setuptools wheel | Out-Null
& $pythonExe -m pip install $sourceDir

if ($LASTEXITCODE -ne 0) {
    throw "Failed to install curator CLI"
}

Write-Host "Curator CLI successfully installed"
