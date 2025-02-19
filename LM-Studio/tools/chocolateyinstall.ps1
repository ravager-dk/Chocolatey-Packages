$ErrorActionPreference = 'Stop'
$url      = 'https://installers.lmstudio.ai/win32/x64/0.3.10-6/LM-Studio-0.3.10-6-x64.exe'
$checksum = "A321CC2DCEEC659CA95AE506EB411E5AF9F362F965729CE7325017B0277D3B6B"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url           = $url
  softwareName  = 'LM Studio*'
  checksum      = $checksum
  checksumType  = 'sha256'
  silentArgs    = "/allusers /S"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs