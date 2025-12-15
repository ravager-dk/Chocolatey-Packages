
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url      = "https://zoom.us/download/vdi/6.5.13.26820/ZoomInstallerVDI.msi?archType=x64"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'msi'
  url64          = $url
  softwareName   = 'Zoom Client for VDI*'

  checksum64     = '2405199EE1CBC376A5BE96F715DB03DC51057FAAF7E769D73C7517CC4F5D7B9D'
  checksumType64 = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs