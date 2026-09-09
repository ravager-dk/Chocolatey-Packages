
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://zoom.us/download/vdi/7.0.12.27080/ZoomVDIUniversalPluginx64.msi?archType=x64'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url64         = $url64
  softwareName  = 'Zoom VDI Universal Plugin*'

  checksum64      = '45184c8a4fc602f8c7e1cfc1cda6ebcdcb202e4e2898cef87eb459bbcf588d0b'
  checksumType64  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
