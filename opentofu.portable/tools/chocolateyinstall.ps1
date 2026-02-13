$ErrorActionPreference = 'Stop'

$toolsPath  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    PackageName  = "opentofu.portable"
    Url          = "https://github.com/opentofu/opentofu/releases/download/v1.11.5/tofu_1.11.5_windows_386.zip"
    Checksum     = "6a82f944ca4d30181d23575621b00271dbbce012ec753fc5e80b0131fac3910b" # Placeholder, will be updated by AU
    ChecksumType = "sha256"
    Url64        = "https://github.com/opentofu/opentofu/releases/download/v1.11.5/tofu_1.11.5_windows_amd64.zip"
    Checksum64   = "74a99d9681a7d55e72e14a57621d857190e2b642fd552b5c914c609b79e27d05" # Placeholder, will be updated by AU
    ChecksumType64 = "sha256"
    UnzipLocation = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
