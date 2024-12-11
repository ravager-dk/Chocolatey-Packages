
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://zoom.us/download/vdi/6.2.10.25600/ZoomVDIUniversalPlugin.msi'
$url64      = "https://zoom.us/download/vdi/6.2.10.25600/ZoomVDIUniversalPluginx64.msi?archType=x64"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64         = $url64
  softwareName  = 'Zoom VDI Universal Plugin*'

  checksum      = '0A0CFC2D1F774F2473C30E64D7995E3ED9C143B2F8661EB4DDBCB14A4AE1E3F5'
  checksumType  = 'sha256'
  checksum64      = 'A5DF1C8011429597C22F115029E46460B730454A615BDAA99ADD6FF5A9AB1118'
  checksumType64  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs