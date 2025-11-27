$ErrorActionPreference = 'Stop'

# Outline is primarily a Docker-based application
# This package provides documentation and installation helpers
# For production use, please follow: https://docs.getoutline.com/

$toolsPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# Create a helper script for Docker deployment
$dockerHelperScript = @'
# Outline Docker Installation Helper
# For detailed instructions, visit: https://docs.getoutline.com/

$version = "0.75.2"
Write-Host "Outline $version"
Write-Host "To deploy Outline, please follow the Docker setup guide at: https://docs.getoutline.com/"
Write-Host ""
Write-Host "Quick start (requires Docker and Docker Compose):"
Write-Host "1. Clone the repository: git clone https://github.com/outline/outline.git"
Write-Host "2. Configure environment variables"
Write-Host "3. Run: docker-compose up -d"
Write-Host ""
Write-Host "For more information, visit: https://docs.getoutline.com/"
'@

$dockerHelperScript | Out-File -FilePath "$toolsPath\outline-docker-helper.ps1" -Encoding UTF8
