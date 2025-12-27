$ErrorActionPreference = 'Stop'

$toolsPath  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    PackageName  = "opentofu.portable"
    Url          = "https://github.com/opentofu/opentofu/releases/download/v1.11.2/tofu_1.11.2_windows_386.zip"
    Checksum     = "6dbec1d6ddda664cfcc6bebebb5f976d1fc02f8beda1365125c3ff8fd5d0cecf" # Placeholder, will be updated by AU
    ChecksumType = "sha256"
    Url64        = "https://github.com/opentofu/opentofu/releases/download/v1.11.2/tofu_1.11.2_windows_amd64.zip"
    Checksum64   = "8c2cc3164eea2a90f1f0200aee2c504fd3e8bac7ea59e38647e8f3223f8eba3c" # Placeholder, will be updated by AU
    ChecksumType64 = "sha256"
    UnzipLocation = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
