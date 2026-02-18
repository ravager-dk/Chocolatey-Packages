
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url      = 'https://zoom.us/download/vdi/6.6.12.26920/ZoomInstallerVDI.msi?archType=x64'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'msi'
  url64          = $url
  softwareName   = 'Zoom Client for VDI*'

  checksum64     = '3d354f3586d6a81ca00653a20aa54fbf718c73b72f1ec3c43f10b53676b9e7f2'
  checksumType64 = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
