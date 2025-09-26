$downloadUri64 = "https://dl.sharefile.com/cfwin/ShareFileForWindows_x64_v25.9.2.0.msi"
$downloadUri = "https://dl.sharefile.com/cfwin/ShareFileForWindows_x86_v25.9.2.0.msi"
$checksum64 = "A1F54A95976EFA8089B8B110433A8C98B51E82C62160571C26687EB636F6D892"
$checksum = "50C940165B9E1CDDF88552C441EF938E74087993AE2C89AD8792AD6F9A1DE7DB"

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