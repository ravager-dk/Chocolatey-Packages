## Template VirtualEngine.Build ChocolateyInstall.ps1 file for EXE/MSI installations

#region version variables
$version = "121"
$Checksum = "042C7BAF6B1D1E2F4B0DF8D501C89ADC6E53A679515297223CB7FE0E1CCF1E46";
$ChecksumType = "sha256";
#endregion version variables

#Get download page for specific version
$sourcePrime = "https://www.citrix.com/downloads/workspace-app/citrix-enterprise-browser-for-windows/"
$responsePrime = Invoke-WebRequest $sourcePrime
$Link = ($responsePrime.Links | where outerHTML -like "*>Citrix Enterprise Browser v$version*").href
if ($null -eq $Link){
    $sourcePrime = "https://www.citrix.com/downloads/workspace-app/earlier-versions-of-citrix-enterprise-browser-for-windows/"
    $responsePrime = Invoke-WebRequest $sourcePrime
    $Link = ($responsePrime.Links | where outerHTML -like "*>Citrix Enterprise Browser v$version*").href
}
if ($null -eq $Link)
{
    throw [System.Net.WebException] "Download URL for version not found"
}
$SourceUrl = "https://www.citrix.com$Link"

#Get downloadlink
$response = Invoke-WebRequest $SourceUrl
$downloadlink = "https:" + ($response.Links | where rel -like "*CitrixEnterpriseBrowserInstaller.exe*")[0].rel

Write-Output $downloadlink

$installChocolateyPackageParams = @{
    PackageName    = "Citrix-Enterprise-Browser";
    FileType       = "EXE";
    SilentArgs     = "--silent";
    Url            = $downloadlink;
    ValidExitCodes = @(0, 102);
    Checksum       = $Checksum;
    ChecksumType   = $ChecksumType;
}
Install-ChocolateyPackage @installChocolateyPackageParams;

<#! POST-INSTALL-TASKS !#>