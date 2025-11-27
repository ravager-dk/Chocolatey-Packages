$ErrorActionPreference = 'Stop'

Get-ChildItem "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" | Where-Object { $_.Extension -ne '.ps1' } | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
