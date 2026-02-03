
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://zoom.us/download/vdi/6.6.11.26890/ZoomVDIUniversalPluginx64.msi?archType=x64'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url64         = $url64
  softwareName  = 'Zoom VDI Universal Plugin*'

  checksum64      = 'a856442830d219043c586ad9ec62d1f6dedeab1bf99a13f351a6b781df71bb0c'
  checksumType64  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
