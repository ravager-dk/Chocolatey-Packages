$ErrorActionPreference = 'Stop'

$packageArgs = @{
    PackageName    = 'curator-cli'
    FileType       = 'zip'
    Url            = 'https://github.com/elastic/curator/releases/download/v9.0.0/curator-9.0.0-windows.zip'
    Url64          = 'https://github.com/elastic/curator/releases/download/v9.0.0/curator-9.0.0-windows.zip'
    ChecksumType   = 'sha256'
    Checksum       = ''
    Checksum64     = ''
    UnzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
}

Install-ChocolateyZipPackage @packageArgs
