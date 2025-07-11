$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# Previous XCP-ng Center versions used a different MSI GUID. Uninstall if found.
$oldGuid = '{45CFD130-100D-4868-BE0C-EA772261E950}'
$oldUninstallPaths = @(
    "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\$oldGuid",
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$oldGuid"
)

foreach ($path in $oldUninstallPaths) {
    if (Test-Path -Path $path) {
        Write-Host "Uninstalling previous XCP-ng Center version with GUID $oldGuid from $path"
        $uninstallString = (Get-ItemProperty -Path $path).UninstallString
        if ($uninstallString) {
            $uninstallArgs = @{
                packageName   = "XCP-ng Center (old GUID)"
                fileType      = 'MSI'
                silentArgs    = "/qn /norestart"
                validExitCodes= @(0, 3010, 1605, 1614, 1641)
                file          = ''
            }
            # For MSI, pass the product code as silentArgs
            $uninstallArgs['silentArgs'] = "$oldGuid $($uninstallArgs['silentArgs'])"
            Uninstall-ChocolateyPackage @uninstallArgs
        }
    }
}

$url = 'https://github.com/xcp-ng/xenadmin/releases/download/v25.04/XCP-ng.Center.msi'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    fileType      = 'MSI'
    url           = $url
    softwareName  = 'XCP-ng Center*'
    checksum      = '58B7FF485C821C13FF3EA0D3C75F207680B1DCE51DE00C08AFE805D3E421325D'
    checksumType  = 'sha256'
    silentArgs    = "/qn"
    validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs