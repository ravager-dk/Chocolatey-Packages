$ErrorActionPreference = 'Stop'

$toolsPath  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    PackageName  = "opentofu.portable"
    Url          = "https://github.com/opentofu/opentofu/releases/download/v1.12.0/tofu_1.12.0_windows_386.zip"
    Checksum     = "30be3a5f017bee124183bf9c493c1f0509f181cd73aae1518cf7b5fb3b6eab50" # Placeholder, will be updated by AU
    ChecksumType = "sha256"
    Url64        = "https://github.com/opentofu/opentofu/releases/download/v1.12.0/tofu_1.12.0_windows_amd64.zip"
    Checksum64   = "7253abf6ce9c0e88e0cc188c5c883e02353b6c5ffcf2125e6c307348ca223df0" # Placeholder, will be updated by AU
    ChecksumType64 = "sha256"
    UnzipLocation = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
