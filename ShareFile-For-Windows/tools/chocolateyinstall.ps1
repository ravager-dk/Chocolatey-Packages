$downloadUri64 = "https://dl.sharefile.com/cfwin/ShareFileForWindows_x64_v25.7.4.0.msi"
$downloadUri = "https://dl.sharefile.com/cfwin/ShareFileForWindows_x86_v25.7.4.0.msi"
$checksum64 = "BCA4AE0D8315A89388D088EB89498FCB6505B1296A2BBF80128DD5F89B1ADBB4"
$checksum = "A3A9BBE80460E64F8783727C89A5B794468717B05036A892E9095C34680BE84D"

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