$ErrorActionPreference = 'Stop'

$toolsPath  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    PackageName  = "opentofu.portable"
    Url          = "https://github.com/opentofu/opentofu/releases/download/v1.11.6/tofu_1.11.6_windows_386.zip"
    Checksum     = "f7551cb9d2e908ba68f355310c945baa0539b269195aa74cbc6aac22e913abc0" # Placeholder, will be updated by AU
    ChecksumType = "sha256"
    Url64        = "https://github.com/opentofu/opentofu/releases/download/v1.11.6/tofu_1.11.6_windows_amd64.zip"
    Checksum64   = "78cc3a836fbaeaee829850c16988739225a7e620827e4d33da7353525276583b" # Placeholder, will be updated by AU
    ChecksumType64 = "sha256"
    UnzipLocation = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
