$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tempDir = Join-Path $env:TEMP "helm-docs-$(Get-Random)"

$url = 'https://github.com/norwoodj/helm-docs/releases/download/v1.14.2/helm-docs_1.14.2_Windows_x86_64.tar.gz'
$checksum = '3c54fd78d99e2769cf83a0faf12cf6cd4de1cac6ed7bee8d908a2c8fc23f538c'

Install-ChocolateyZipPackage -PackageName 'helm-docs' -Url $url -Checksum $checksum -ChecksumType 'sha256' -Destination $tempDir
Get-ChocolateyUnzip -fileFullPath (Join-Path $tempDir helm-docs_1.14.2_Windows_x86_64.tar) -Destination $toolsDir
# Cleanup temp files
Remove-Item $tempDir -Recurse -Force -ErrorAction SilentlyContinue
