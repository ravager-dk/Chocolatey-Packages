$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tempDir = Join-Path $env:TEMP "helm-docs-$(Get-Random)"

$packageArgs = @{
    PackageName    = 'helm-docs'
    Url            = 'https://github.com/norwoodj/helm-docs/releases/download/v1.14.2/helm-docs_1.14.2_Windows_x86_64.tar.gz'
    ChecksumType   = 'sha256'
    Checksum       = '3c54fd78d99e2769cf83a0faf12cf6cd4de1cac6ed7bee8d908a2c8fc23f538c'
    UnzipLocation  = $tempDir
}

# Download and extract tar.gz
Get-ChocolateyWebFile @packageArgs
7z x "$($packageArgs.UnzipLocation)/*.tar.gz" -o"$tempDir" | Out-Null
7z x "$tempDir/*.tar" -o"$toolsDir" | Out-Null

# Cleanup temp files
Remove-Item $tempDir -Recurse -Force -ErrorAction SilentlyContinue
