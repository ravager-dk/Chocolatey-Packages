
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://zoom.us/download/vdi/6.6.13.26950/ZoomVDIUniversalPluginx64.msi?archType=x64'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url64         = $url64
  softwareName  = 'Zoom VDI Universal Plugin*'

  checksum64      = '3c3afea22821d74d5f09b2aa26d00a603e955ac3d18f6c5324f2e82b97dc6e46'
  checksumType64  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
