$ErrorActionPreference = 'Stop'

$toolsPath  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    PackageName  = "opentofu.portable"
    Url          = "https://github.com/opentofu/opentofu/releases/download/v1.11.7/tofu_1.11.7_windows_386.zip"
    Checksum     = "dfad728117c5e6359a0b3b566ada6fb89d9bc26542c040b4267d854f0d537beb" # Placeholder, will be updated by AU
    ChecksumType = "sha256"
    Url64        = "https://github.com/opentofu/opentofu/releases/download/v1.11.7/tofu_1.11.7_windows_amd64.zip"
    Checksum64   = "2db22ececfb611f624a05ab34854b30ae60ca7f582bc9902d9133533cef1b3ab" # Placeholder, will be updated by AU
    ChecksumType64 = "sha256"
    UnzipLocation = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
