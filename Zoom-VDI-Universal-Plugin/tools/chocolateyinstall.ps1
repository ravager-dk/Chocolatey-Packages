
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://zoom.us/download/vdi/6.2.11.25670/ZoomVDIUniversalPlugin.msi'
$url64      = "https://zoom.us/download/vdi/6.2.11.25670/ZoomVDIUniversalPluginx64.msi?archType=x64"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64         = $url64
  softwareName  = 'Zoom VDI Universal Plugin*'

  checksum      = '6A1F02EDCC1DB3C1FD802A06D8247A549C83A259D09792E390E6AD8073BC3489'
  checksumType  = 'sha256'
  checksum64      = 'A99639FFE44537E2131E37DB55DF82CD2F6968ED391044977B34005FAEBBB8F5'
  checksumType64  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs