$ErrorActionPreference = 'Stop'

$toolsPath  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    PackageName  = "opentofu.portable"
    Url          = "https://github.com/opentofu/opentofu/releases/download/v1.11.3/tofu_1.11.3_windows_386.zip"
    Checksum     = "67663969f11d424c38745eb1b61c89d5348f6b26c0af087e2ca528ae6aeb9ab4" # Placeholder, will be updated by AU
    ChecksumType = "sha256"
    Url64        = "https://github.com/opentofu/opentofu/releases/download/v1.11.3/tofu_1.11.3_windows_amd64.zip"
    Checksum64   = "848d4bfdfdc6d5e03d66f97d8d403319c12c1abdb7e7fcfefb993a00b2b6b738" # Placeholder, will be updated by AU
    ChecksumType64 = "sha256"
    UnzipLocation = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
