$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tempDir = Join-Path $env:TEMP "helm-docs-$(Get-Random)"
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null

$url = 'https://github.com/norwoodj/helm-docs/releases/download/v1.14.2/helm-docs_1.14.2_Windows_x86_64.tar.gz'
$checksum = '3c54fd78d99e2769cf83a0faf12cf6cd4de1cac6ed7bee8d908a2c8fc23f538c'
$tarGzFile = Join-Path $tempDir 'helm-docs.tar.gz'

# Download the file
Get-ChocolateyWebFile -PackageName 'helm-docs' -FileFullPath $tarGzFile -Url $url -Checksum $checksum -ChecksumType 'sha256'

# Extract tar.gz using 7z
7z x $tarGzFile -o"$tempDir" | Out-Null
7z x (Join-Path $tempDir 'helm-docs_*.tar') -o"$toolsDir" | Out-Null

# Cleanup temp files
Remove-Item $tempDir -Recurse -Force -ErrorAction SilentlyContinue
