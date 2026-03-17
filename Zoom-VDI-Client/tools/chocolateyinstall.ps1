
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url      = 'https://zoom.us/download/vdi/6.6.13.26950/ZoomInstallerVDI.msi?archType=x64'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'msi'
  url64          = $url
  softwareName   = 'Zoom Client for VDI*'

  checksum64     = 'f0e5bdba8711e33e388106db45bc57e7e7c3eaa72d1029d04d27268e7ef911db'
  checksumType64 = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
