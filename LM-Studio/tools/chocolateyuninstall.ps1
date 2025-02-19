$ErrorActionPreference = 'Stop'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'LM Studio*'
  fileType      = 'EXE'
  silentArgs    = '/allusers /S'
  validExitCodes= @(0, 3010, 1605, 1614, 1641)
  file          = "C:\Program Files\LM Studio\Uninstall LM Studio.exe"
}

Uninstall-ChocolateyPackage @packageArgs