$ErrorActionPreference = 'Stop'

$packageArgs = @{
    PackageName    = 'qztray'
    FileType       = 'exe'
    Url            = 'https://github.com/qzind/tray/releases/download/v2.2.5/qz-tray-2.2.5-arm64.exe'
    Url64          = 'https://github.com/qzind/tray/releases/download/v2.2.5/qz-tray-2.2.5-x86_64.exe'
    ChecksumType   = 'sha256'
    Checksum       = ''
    Checksum64     = ''
    SilentArgs     = '/S'
    ValidExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
