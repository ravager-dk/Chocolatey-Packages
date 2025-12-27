$ErrorActionPreference = 'Stop'

$toolsPath  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    PackageName  = "opentofu.portable"
    Url          = "https://github.com/opentofu/opentofu/releases/download/v1.11.1/tofu_1.11.1_windows_386.zip"
    Checksum     = "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" # Placeholder, will be updated by AU
    ChecksumType = "sha256"
    Url64        = "https://github.com/opentofu/opentofu/releases/download/v1.11.1/tofu_1.11.1_windows_amd64.zip"
    Checksum64   = "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" # Placeholder, will be updated by AU
    ChecksumType64 = "sha256"
    UnzipLocation = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
