import-module au

$releases = 'https://api.github.com/repos/opentofu/opentofu/releases'

function global:au_SearchReplace {
    @{
        ".\opentofu.nuspec" = @{
            "(?i)<dependency id=`"opentofu.portable`" version=`"\[.*\]`" />" = "<dependency id=`"opentofu.portable`" version=`"[$($Latest.Version)]`" />"
            "(?i)(<releaseNotes>)(.*)(<\/releaseNotes>)"                     = "`$1https://github.com/opentofu/opentofu/releases/tag/v$($Latest.Version)`$3"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $json = $download_page.Content | ConvertFrom-Json
    
    # Filter for stable releases
    $release = $json | Where-Object { $_.prerelease -eq $false } | Select-Object -First 1
    $version = $release.tag_name -replace '^v', ''
    
    @{
        Version = $version
    }
}

Update-Package
