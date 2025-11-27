$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tempDir = Join-Path $env:TEMP "helm-docs-$(Get-Random)"
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null

$url = 'https://github.com/norwoodj/helm-docs/releases/download/v1.14.2/helm-docs_1.14.2_Windows_x86_64.tar.gz'
$checksum = '3c54fd78d99e2769cf83a0faf12cf6cd4de1cac6ed7bee8d908a2c8fc23f538c'
$tarGzFile = Join-Path $tempDir 'helm-docs.tar.gz'

# Download the file
Get-ChocolateyWebFile -PackageName 'helm-docs' -FileFullPath $tarGzFile -Url $url -Checksum $checksum -ChecksumType 'sha256'

# Extract tar.gz using 7z (first extract gzip to get tar, then extract tar)
$extractOutput = & 7z x $tarGzFile -o"$tempDir" -y
if ($LASTEXITCODE -ne 0) { throw "Failed to extract tar.gz" }

# Find and extract the tar file
$tarFile = Get-ChildItem $tempDir -Filter "*.tar" | Select-Object -First 1
if ($null -eq $tarFile) { throw "No tar file found after extracting tar.gz" }

$extractOutput = & 7z x $tarFile.FullName -o"$toolsDir" -y
if ($LASTEXITCODE -ne 0) { throw "Failed to extract tar file" }

# Cleanup temp files
Remove-Item $tempDir -Recurse -Force -ErrorAction SilentlyContinue
