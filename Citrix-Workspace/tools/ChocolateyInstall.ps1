## Template VirtualEngine.Build ChocolateyInstall.ps1 file for EXE/MSI installations

<#! PRE-INSTALL-TASKS !#>
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


#region version variables
$version = "2311"
$Checksum = "70d5df4d76257453cb9ae386d9a861cda45cc45c9886ee143660ecaf633414c7";
$ChecksumType = "sha256";
#endregion version variables

#Get download page for specific version
$sourcePrime = "https://www.citrix.com/downloads/workspace-app/"
$responsePrime = Invoke-WebRequest $sourcePrime
$Link = ($responsePrime.Links | where outerHTML -like "*>Citrix Workspace app $version for Windows<*").href
$SourceUrl = "https://www.citrix.com$Link"

#Get downloadlink
$response = Invoke-WebRequest $SourceUrl
$downloadlink = "https:" + ($response.Links | where rel -like "*CitrixWorkspaceApp.exe*")[0].rel

Write-Output $downloadlink

$installChocolateyPackageParams = @{
    PackageName    = "Citrix-Workspace";
    FileType       = "EXE";
    SilentArgs     = "/noreboot /silent /AutoUpdateCheck=disabled";
    Url            = $downloadlink;
    ValidExitCodes = @(0, 3010, 40008);
    Checksum       = $Checksum;
    ChecksumType   = $ChecksumType;
}
Install-ChocolateyPackage @installChocolateyPackageParams;

<#! POST-INSTALL-TASKS !#>
