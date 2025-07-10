$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$xcpng_old64 = Test-Path -Path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{45CFD130-100D-4868-BE0C-EA772261E950}"
$xcpng_old32 = Test-Path -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{45CFD130-100D-4868-BE0C-EA772261E950}"

if ($xcpng_old64 -or $xcpng_old32) {
  Invoke-Expression -Command (Join-Path -Path $toolsDir -ChildPath "chocolateyuninstall.ps1")
}

$url        = 'https://github.com/xcp-ng/xenadmin/releases/download/v25.04/XCP-ng.Center.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  softwareName  = 'XCP-ng Center*'
  checksum      = '58B7FF485C821C13FF3EA0D3C75F207680B1DCE51DE00C08AFE805D3E421325D'
  checksumType  = 'sha256'
  silentArgs    = "/qn"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs