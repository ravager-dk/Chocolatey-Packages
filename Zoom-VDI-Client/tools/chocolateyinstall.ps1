
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url      = "https://zoom.us/download/vdi/6.5.12.26790/ZoomInstallerVDI.msi?archType=x64"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'msi'
  url64          = $url
  softwareName   = 'Zoom Client for VDI*'

  checksum64     = '8F828901216F0346691AC2B53086B1F62EA3D565E3133A78E0DBE613FB3A871A'
  checksumType64 = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs