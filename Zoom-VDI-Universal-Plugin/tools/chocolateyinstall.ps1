
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://zoom.us/download/vdi/7.0.10.26980/ZoomVDIUniversalPluginx64.msi?archType=x64'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url64         = $url64
  softwareName  = 'Zoom VDI Universal Plugin*'

  checksum64      = '272aa8fd0cc86a01a0741fe55aab28189c25d00344d4d71f6a884acf90c0664c'
  checksumType64  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
