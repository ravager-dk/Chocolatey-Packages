$ErrorActionPreference = 'Stop'

$toolsPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# Remove helper files
Get-ChildItem "$toolsPath" -Filter "*.ps1" | Where-Object { $_.Name -ne 'chocolateyuninstall.ps1' } | Remove-Item -Force -ErrorAction SilentlyContinue
