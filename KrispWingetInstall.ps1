#Install Winget | Krisp
#Author: Sim Cmngs

# Check if winget is installed
$wingetInstalled = Get-Command winget -ErrorAction SilentlyContinue

# Install winget if it's not installed
if (-not $wingetInstalled) {
    Write-Host "Installing winget..."
    Invoke-WebRequest -Uri "https://github.com/microsoft/winget-cli/releases/latest/download/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle" -OutFile "$env:TEMP\winget.appxbundle"
    Add-AppxPackage -Path "$env:TEMP\winget.appxbundle"
    Write-Host "winget installed successfully."
}

# Install Krisp using winget
Write-Host "Installing Krisp..."
winget install Krisp.Krisp -e
Write-Host "Krisp installed successfully."
