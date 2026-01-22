$ErrorActionPreference = 'Stop'

$toolsPath  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    PackageName  = "opentofu.portable"
    Url          = "https://github.com/opentofu/opentofu/releases/download/v1.11.4/tofu_1.11.4_windows_386.zip"
    Checksum     = "59551bbaef6af4903b3b93856e31cf0474a45da2c51ddedf62ce11ae5ac78433" # Placeholder, will be updated by AU
    ChecksumType = "sha256"
    Url64        = "https://github.com/opentofu/opentofu/releases/download/v1.11.4/tofu_1.11.4_windows_amd64.zip"
    Checksum64   = "7a2fe84de33edd4fe326b25a39c5d25886f7a94336c0148499c95f188b84872a" # Placeholder, will be updated by AU
    ChecksumType64 = "sha256"
    UnzipLocation = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
