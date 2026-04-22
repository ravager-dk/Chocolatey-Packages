
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url      = 'https://zoom.us/download/vdi/6.6.14.26970/ZoomInstallerVDI.msi?archType=x64'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'msi'
  url64          = $url
  softwareName   = 'Zoom Client for VDI*'

  checksum64     = 'efe3542efe9011ae3604b497b021b56ee8b7e2fffd14cc2b88f917e4ddfc661d'
  checksumType64 = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
