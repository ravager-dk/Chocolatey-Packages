$ErrorActionPreference = 'Stop'

$toolsPath  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    PackageName  = "opentofu.portable"
    Url          = "https://github.com/opentofu/opentofu/releases/download/v1.12.4/tofu_1.12.4_windows_386.zip"
    Checksum     = "ea95fcb928d566f4a8ef86167e57957b10b34d8f4aa424bc4f1a7bd6ec4b3fc5" # Placeholder, will be updated by AU
    ChecksumType = "sha256"
    Url64        = "https://github.com/opentofu/opentofu/releases/download/v1.12.4/tofu_1.12.4_windows_amd64.zip"
    Checksum64   = "16a8d272e368c8e4fdb5c665fb9dbb4bc89b505cf32895bc4d81c21dfd6beda9" # Placeholder, will be updated by AU
    ChecksumType64 = "sha256"
    UnzipLocation = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
