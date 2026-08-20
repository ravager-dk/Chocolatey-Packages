$ErrorActionPreference = 'Stop'

$toolsPath  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    PackageName  = "opentofu.portable"
    Url          = "https://github.com/opentofu/opentofu/releases/download/v1.12.6/tofu_1.12.6_windows_386.zip"
    Checksum     = "2eb7ea38ce3a0127a855413f03e79153761185137eb01c4f1c4471b4a405b777" # Placeholder, will be updated by AU
    ChecksumType = "sha256"
    Url64        = "https://github.com/opentofu/opentofu/releases/download/v1.12.6/tofu_1.12.6_windows_amd64.zip"
    Checksum64   = "0d1421721cf9ec24b41b698a9620dda218d47fa7e76ac3dc15cdbc13bd79b0bb" # Placeholder, will be updated by AU
    ChecksumType64 = "sha256"
    UnzipLocation = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
