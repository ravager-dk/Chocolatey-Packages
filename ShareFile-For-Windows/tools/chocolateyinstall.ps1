$downloadUri64 = "https://dl.sharefile.com/cfwin/ShareFileForWindows_x64_v25.6.5.0.msi"
$downloadUri = "https://dl.sharefile.com/cfwin/ShareFileForWindows_x86_v25.6.5.0.msi"
$checksum64 = "4319CB08F22319924A7111BA3A9ADAF665170A1DE207B3F71674D28AEC486A25"
$checksum = "7B6889FFF452DD090EEFF525EA819586134320BD10220CE2AE8EA7FF28EABC25"

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