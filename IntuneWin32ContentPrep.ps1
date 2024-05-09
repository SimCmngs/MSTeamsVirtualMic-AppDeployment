#Convert exe to intunewin | Win32 Content Prep Tool
#Author: Sim Cmngs

# Edit these variables to match your SETUP
$IntuneWinAppUtilFolder = "C:\Intune\3-IntuneWinAppUtil" # REPLACE with Intune Win32 Content Prep Tool location 
$SourceFolder = "C:\Intune\1-Krisp" # REPLACE with app setup file location 
$SetupFile = "Krisp_2.33.5" # REPLACE with name of app setup file
$OutputFolder = "C:\Intune\2-IntuneApps" # REPLACE with folder location to save IntuneWin file

# Change Directory
Set-Location -Path $IntuneWinAppUtilFolder

# Run Intune Win32 Content prep tool with parameters
& "$IntuneWinAppUtilFolder\IntuneWinAppUtil.exe" -c "$SourceFolder" -s "$SourceFolder\$SetupFile.exe" -o "$OutputFolder" -q
