$ErrorActionPreference = 'Stop'

$packageArgs = @{
    PackageName    = 'qztray'
    FileType       = 'exe'
    Url            = 'https://github.com/qzind/tray/releases/download/v2.2.5/qz-tray-2.2.5-x86.exe'
    Url64          = 'https://github.com/qzind/tray/releases/download/v2.2.5/qz-tray-2.2.5-x86_64.exe'
    Checksum       = ''
    Checksum64     = ''
    ChecksumType   = 'sha256'
    SilentArgs     = '/S'
    ValidExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
