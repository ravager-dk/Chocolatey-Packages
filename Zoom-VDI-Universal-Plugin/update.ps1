import-module au

$releases = 'https://support.zoom.com/hc/en/article?id=zm_kb&sysparm_article=KB0063810'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1"      = @{
            '(?i)(^\s*\$url64\s*=\s*).*'    = "`$1'$($Latest.URL32)'"
            '(?i)(^\s*checksum64\s*=\s*).*' = "`$1'$($Latest.Checksum32)'"
        }
        ".\zoom-vdi-universal-plugin.nuspec" = @{
            "(?i)(<version>).*(</version>)" = "`$1$($Latest.Version)`$2"
        }
    }
}

function global:au_GetLatest {
    # Use a user agent to avoid being blocked
    $content = (Invoke-WebRequest -Uri $releases -UserAgent 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36' -UseBasicParsing).Content
    
    # Regex to find the VDI Universal Plugin URL
    # Matches both standard = and HTML encoded &#61;
    # Looking for: https://zoom.us/download/vdi/{version}/ZoomVDIUniversalPluginx64.msi?archType=x64
    $urlMatch = [regex]::match($content, 'https://zoom.us/download/vdi/([\d\.]+)/ZoomVDIUniversalPluginx64\.msi\?archType(?:=|&#61;)x64')
    
    if ($urlMatch.Success) {
        $version = $urlMatch.Groups[1].Value
        # Decode the URL to ensure it is valid for download
        $url = $urlMatch.Value.Replace('&#61;', '=')
        
        return @{
            Version = $version
            URL32   = $url
        }
    }
    else {
        throw "Could not find Zoom VDI Universal Plugin download URL in the page."
    }
}

Update-Package -ChecksumFor 32
