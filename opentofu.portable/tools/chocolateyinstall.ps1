$ErrorActionPreference = 'Stop'

$toolsPath  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    PackageName  = "opentofu.portable"
    Url          = "https://github.com/opentofu/opentofu/releases/download/v1.12.2/tofu_1.12.2_windows_386.zip"
    Checksum     = "8e2661020bc92afdebbb763275a329399c36a384cd9f987d815a950d8fdd0aba" # Placeholder, will be updated by AU
    ChecksumType = "sha256"
    Url64        = "https://github.com/opentofu/opentofu/releases/download/v1.12.2/tofu_1.12.2_windows_amd64.zip"
    Checksum64   = "9c9c33b6a92b8d8c4850dd562df199767c825bff4c08f0955a59bad0c5d5ffaf" # Placeholder, will be updated by AU
    ChecksumType64 = "sha256"
    UnzipLocation = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
