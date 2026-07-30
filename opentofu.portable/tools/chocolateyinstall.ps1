$ErrorActionPreference = 'Stop'

$toolsPath  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    PackageName  = "opentofu.portable"
    Url          = "https://github.com/opentofu/opentofu/releases/download/v1.12.5/tofu_1.12.5_windows_386.zip"
    Checksum     = "ec00f9e6c3ac3cbad01ed808a9d1da92cdbf0abbefafb41d7b511bbae342b55a" # Placeholder, will be updated by AU
    ChecksumType = "sha256"
    Url64        = "https://github.com/opentofu/opentofu/releases/download/v1.12.5/tofu_1.12.5_windows_amd64.zip"
    Checksum64   = "465adc4bdf4aa80c650387b7ada2cf750f7908bf1fae7f35b05402c384e79928" # Placeholder, will be updated by AU
    ChecksumType64 = "sha256"
    UnzipLocation = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
