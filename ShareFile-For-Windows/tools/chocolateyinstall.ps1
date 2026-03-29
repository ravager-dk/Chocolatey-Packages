$downloadUri64 = "https://dl.sharefile.com/cfwin/ShareFileForWindows_x64_v26.3.12.0.msi"
$downloadUri = "https://dl.sharefile.com/cfwin/ShareFileForWindows_x86_v26.3.12.0.msi"
$checksum64 = "F47FD55D18370B8ACD75190B4684431F0EE0946994BE9ED35B95514011105CF0"
$checksum = "09432F39BDFB73B6E9EE7614E8AAE53B14E5301C7DEDF8ED48B2318C7E328CC5"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'msi'
  url            = $downloadUri
  Url64bit       = $downloadUri64
  softwareName   = 'ShareFile'
  checksum       = $checksum
  checksumType   = 'sha256'
  Checksum64     = $checksum64
  ChecksumType64 = 'sha256'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs