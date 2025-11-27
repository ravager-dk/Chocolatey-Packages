$ErrorActionPreference = 'Stop'

$packageArgs = @{
    PackageName    = 'curator-cli'
    FileType       = 'zip'
    Url            = 'https://github.com/elastic/curator/releases/download/v8.3.2/curator-8.3.2-windows-x86.zip'
    Url64          = 'https://github.com/elastic/curator/releases/download/v8.3.2/curator-8.3.2-windows-x64.zip'
    Checksum       = ''
    Checksum64     = ''
    ChecksumType   = 'sha256'
    UnzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
}

Install-ChocolateyZipPackage @packageArgs
