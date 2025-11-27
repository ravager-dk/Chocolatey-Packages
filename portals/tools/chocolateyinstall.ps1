$ErrorActionPreference = 'Stop'

# Portals is primarily a web-based application
# This package provides documentation and installation helpers
# For production use, please follow: https://github.com/portals-me/portals

$toolsPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# Create a helper script for deployment
$deploymentHelper = @'
# Portals Installation Helper
# For detailed instructions, visit: https://github.com/portals-me/portals

$version = "1.0.0"
Write-Host "Portals $version"
Write-Host "Portals is a web-based team collaboration platform."
Write-Host ""
Write-Host "Installation options:"
Write-Host "1. Docker: docker run -p 3000:3000 portalsme/portals"
Write-Host "2. Node.js: npm install && npm start"
Write-Host "3. Docker Compose: See https://github.com/portals-me/portals"
Write-Host ""
Write-Host "For detailed setup instructions, visit: https://github.com/portals-me/portals#setup"
'@

$deploymentHelper | Out-File -FilePath "$toolsPath\portals-deployment-helper.ps1" -Encoding UTF8
