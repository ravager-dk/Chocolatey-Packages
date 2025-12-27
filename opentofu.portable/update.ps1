import-module au

$releases = 'https://api.github.com/repos/opentofu/opentofu/releases'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)([`"'].*[`"'])"        = "`$1`"$($Latest.URL32)`""
            "(?i)(^\s*checksum\s*=\s*)([`"'].*[`"'])"   = "`$1`"$($Latest.Checksum32)`""
            "(?i)(^\s*url64\s*=\s*)([`"'].*[`"'])"      = "`$1`"$($Latest.URL64)`""
            "(?i)(^\s*checksum64\s*=\s*)([`"'].*[`"'])" = "`$1`"$($Latest.Checksum64)`""
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $json = $download_page.Content | ConvertFrom-Json
    
    # Filter for stable releases (not pre-release)
    $release = $json | Where-Object { $_.prerelease -eq $false } | Select-Object -First 1
    $version = $release.tag_name -replace '^v', ''
    
    $url32 = $release.assets | Where-Object { $_.name -like "*windows_386.zip" } | Select-Object -ExpandProperty browser_download_url
    $url64 = $release.assets | Where-Object { $_.name -like "*windows_amd64.zip" } | Select-Object -ExpandProperty browser_download_url

    @{
        Version    = $version
        URL32      = $url32
        URL64      = $url64
        Checksum32 = Get-RemoteChecksum $url32
        Checksum64 = Get-RemoteChecksum $url64
    }
}

Update-Package
