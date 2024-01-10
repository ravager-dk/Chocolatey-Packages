## Template VirtualEngine.Build ChocolateyInstall.ps1 file for EXE/MSI installations

function Test-ChocolateyPackageInstalled
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $Package
    )
    process
    {
        if ((-not [System.String]::IsNullOrEmpty($env:ChocolateyInstall)) -and (Test-Path -Path $env:ChocolateyInstall))
        {
            $isPackageInstalled = Test-Path -Path "$env:ChocolateyInstall\lib\$Package"
        }
        else
        {
            throw 'Can''t find a chocolatey install directory...'
        }
        return $isPackageInstalled
    }
}

if (Test-ChocolateyPackageInstalled -Package 'citrix-workspace-ltsr')
{
    throw 'Package ''Citrix-Workspace-LTSR'' is already installed. Aborting ''Citrix-Workspace'' (Current Release) package installation.'
}

$installChocolateyPackageParams = @{
    PackageName    = "Citrix-Workspace";
    FileType       = "EXE";
    SilentArgs     = "/noreboot /silent /AutoUpdateCheck=disabled";
    Url            = "https://downloadplugins.citrix.com/ReceiverUpdates/Prod/Receiver/Win/CitrixWorkspaceApp23.11.0.132.exe";
    ValidExitCodes = @(0,3010,40008);
    Checksum       = "70D5DF4D76257453CB9AE386D9A861CDA45CC45C9886EE143660ECAF633414C7";
    ChecksumType   = "sha256";
}
Install-ChocolateyPackage @installChocolateyPackageParams;

<#! POST-INSTALL-TASKS !#>
