$ErrorActionPreference = 'Stop'

$toolsPath  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    PackageName  = "opentofu.portable"
    Url          = "https://github.com/opentofu/opentofu/releases/download/v1.12.3/tofu_1.12.3_windows_386.zip"
    Checksum     = "5839c7e22aeb1cdbf58be093c0cb691176ca303efe8fb53849df42cc96579cce" # Placeholder, will be updated by AU
    ChecksumType = "sha256"
    Url64        = "https://github.com/opentofu/opentofu/releases/download/v1.12.3/tofu_1.12.3_windows_amd64.zip"
    Checksum64   = "92d2087f0ba8e676e75d940c20b5359f191c518e2916d4e77f9d1fe38bbd3f52" # Placeholder, will be updated by AU
    ChecksumType64 = "sha256"
    UnzipLocation = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
