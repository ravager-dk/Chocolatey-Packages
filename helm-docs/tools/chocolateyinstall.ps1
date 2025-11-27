$ErrorActionPreference = 'Stop'

$packageArgs = @{
    PackageName    = 'helm-docs'
    Url            = 'https://github.com/norwoodj/helm-docs/releases/download/v1.14.2/helm-docs_1.14.2_windows_386.tar.gz'
    Url64          = 'https://github.com/norwoodj/helm-docs/releases/download/v1.14.2/helm-docs_1.14.2_windows_amd64.tar.gz'
    ChecksumType   = 'sha256'
    Checksum       = ''
    Checksum64     = ''
    UnzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
}

Install-ChocolateyZipPackage @packageArgs
