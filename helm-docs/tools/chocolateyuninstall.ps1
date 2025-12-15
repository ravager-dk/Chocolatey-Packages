$ErrorActionPreference = 'Stop'

Get-ChildItem "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" | Where-Object { $_.Name -like '*helm-docs*' -and $_.Extension -ne '.ps1' } | Remove-Item -Force -ErrorAction SilentlyContinue
