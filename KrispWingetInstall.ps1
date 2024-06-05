#Install Krisp | Winget
#Author: Sim Cmngs

# Install winget if it's not installed
if (-not $wingetInstalled) {
    $latestWingetMsixBundleUri = $(Invoke-RestMethod https://api.github.com/repos/microsoft/winget-cli/releases/latest).assets.browser_download_url | Where-Object {$_.EndsWith(".msixbundle")}
    $latestWingetMsixBundle = $latestWingetMsixBundleUri.Split("/")[-1]

    # Download Visual C++ Runtime and Winget packages
    Invoke-WebRequest -Uri $latestWingetMsixBundleUri -OutFile "$env:TEMP\$latestWingetMsixBundle"
    Invoke-WebRequest -Uri https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx -OutFile "$env:TEMP\Microsoft.VCLibs.x64.14.00.Desktop.appx"

    # Install Visual C++ Runtime and Winget packages
    Add-AppxPackage -Path "$env:TEMP\Microsoft.VCLibs.x64.14.00.Desktop.appx"
    Add-AppxPackage -Path "$env:TEMP\$latestWingetMsixBundle"
}

# Install Krisp using winget
winget install Krisp.Krisp -e