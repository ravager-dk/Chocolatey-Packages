$ErrorActionPreference = 'Stop'

$packageArgs = @{
    PackageName    = 'helm-docs'
    Url            = 'https://github.com/norwoodj/helm-docs/releases/download/v1.14.2/helm-docs_1.14.2_Windows_arm64.tar.gz'
    Url64          = 'https://github.com/norwoodj/helm-docs/releases/download/v1.14.2/helm-docs_1.14.2_Windows_x86_64.tar.gz'
    ChecksumType   = 'sha256'
    Checksum       = 'c6a5f43e89837bd29749298ca27ed350ca8ee6ef64e25ce9653e709171dbbaa4'
    Checksum64     = '3c54fd78d99e2769cf83a0faf12cf6cd4de1cac6ed7bee8d908a2c8fc23f538c'
    UnzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
}

Install-ChocolateyZipPackage @packageArgs
