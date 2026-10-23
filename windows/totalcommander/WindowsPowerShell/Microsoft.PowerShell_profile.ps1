Import-Module posh-git
#Import-Module oh-my-posh
oh-my-posh init pwsh -c "C:\home\ps\poshgit\poshgitprofile.json" | Invoke-Expression


if ($host.Name -eq 'ConsoleHost')
{
    Import-Module -Name PSReadLine
    Import-Module -Name Terminal-Icons
    Import-Module -Name localsalesforce
    Import-Module -Name localsecurity
    Import-Module -Name PSFzf
}


# Wire up the linked files 
#https://github.com/jayharris/dotfiles-windows/blob/master/profile.ps1
Push-Location (Split-Path -parent $profile)
"components","variables","functions","aliases","exports","other" | Where-Object {Test-Path "$_.ps1"} | ForEach-Object -process {Invoke-Expression ". .\$_.ps1"}
Pop-Location


# Load scripts from the following locations
$env:Path += ";C:\home\ps"
$env:Path += ";C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE\Extensions\Microsoft\Azure Storage Emulator"


# Set Defaults
Set-Location "$actualhome"
$env:LANG = 'en_IE'

function cf {
    if ( $(Get-Module PSFzf) -ne $null ) {
        Get-ChildItem . -Recurse -Attributes Directory | Invoke-Fzf | Set-Location
    } else {
        Write-Error "please install PSFzf"
    }
}


print-adminheader 

print-environment