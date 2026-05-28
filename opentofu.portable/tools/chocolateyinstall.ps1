$ErrorActionPreference = 'Stop'

$toolsPath  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    PackageName  = "opentofu.portable"
    Url          = "https://github.com/opentofu/opentofu/releases/download/v1.12.1/tofu_1.12.1_windows_386.zip"
    Checksum     = "316f97cb304f31c7bcc109e2a733a598c4af184d102ee0903554c70383bd8578" # Placeholder, will be updated by AU
    ChecksumType = "sha256"
    Url64        = "https://github.com/opentofu/opentofu/releases/download/v1.12.1/tofu_1.12.1_windows_amd64.zip"
    Checksum64   = "a6d8fd924753ab6d3d4f0143d29214a31679a5fca8bfb59f5edde263b3a1c3fc" # Placeholder, will be updated by AU
    ChecksumType64 = "sha256"
    UnzipLocation = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
