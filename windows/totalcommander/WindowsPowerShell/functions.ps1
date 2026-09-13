# Sudo
function sudo() {
    if ($args.Length -eq 1) {
        start-process $args[0] -verb "runAs"
    }
    if ($args.Length -gt 1) {
        start-process $args[0] -ArgumentList $args[1..$args.Length] -verb "runAs"
    }
}


function Start-Azurite {
    & "azurite --silent --location c:\home\azurite --debug c:\home\azurite\debug.log"
}
Function Set-guid {[System.Guid]::NewGuid()}

$taillength         = 50

Function get_tail($path) {Get-Content -Tail $taillength "$path"}
Function get_head($path) {Get-Content -Head $taillength "$path"}

Function Set-PathVariable {
    param (
        [string]$AddPath,
        [string]$RemovePath
    )
    $regexPaths = @()
    if ($PSBoundParameters.Keys -contains 'AddPath'){
        $regexPaths += [regex]::Escape($AddPath)
    }

    if ($PSBoundParameters.Keys -contains 'RemovePath'){
        $regexPaths += [regex]::Escape($RemovePath)
    }
    
    $arrPath = $env:Path -split ';'
    foreach ($path in $regexPaths) {
        $arrPath = $arrPath | Where-Object {$_ -notMatch "^$path\\?"}
    }
    $env:Path = ($arrPath + $addPath) -join ';'
}

function touch {
  ForEach ($file in $args) {
    New-Item -Path $file -Force | Out-Null
  }
}

#[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Program Files\dotnet", "Machine")

function so     ($q) {Start-Process http://stackoverflow.com/search?q=$q}
function google ($q) {Start-Process http://www.google.com/?#q=$q}

function findprocess ($q){
     Get-Process -Name "$q"
}

function findprocesslike ($q){
    Get-Process | Where-Object { $_.ProcessName -like "*$q*" }
}

# profile 
Function reloadprofile(){
    . $PROFILE.CurrentUserCurrentHost
    # can alos be done with & $profile
}

function checkforsoftwareupdates { & winget list --upgrade-available}



function Get-Environment {  # Get-Variable to show all Powershell Variables accessible via $
    if ( $args.Count -eq 0 ) {
        Get-Childitem env:
    } elseif( $args.Count -eq 1 ) {
        Start-Process (Get-Command $args[0]).Source
    } else {
        Start-Process (Get-Command $args[0]).Source -ArgumentList $args[1..($args.Count-1)]
    }
}




# Common Editing needs
function Edit-Profile{code $profile.CurrentUserAllHosts}


#region Navigation

function  ..    {Set-Location ..}
function  ...   {Set-Location ..\..}
function  ....  {Set-Location ..\..\..}
function  ..... {Set-Location ..\..\..\..}

# https://github.com/jayharris/dotfiles-windows/blob/master/functions.ps1
function CreateAndSet-Directory([String] $path) { New-Item $path -ItemType Directory -ErrorAction SilentlyContinue; Set-Location $path}

# https://github.com/ChrisTitusTech/powershell-profile/blob/main/Microsoft.PowerShell_profile.ps1
function New-File { param($name) New-Item -ItemType "file" -Path . -Name $name }

function Set-Explorer-Here(){Invoke-Item .}

Function Set-Location-home { Set-Location "$actualhome" }
Function Set-Location-repo { Set-Location "$REPO_DIR" }
function Set-Location-desktop { Set-Location "$DESKTOP_DIR" }
function Set-Location-dump { Set-Location "$DUMP_DIR" }
function Set-Location-profile {Set-Location "C:\Users\hurstc\Documents\WindowsPowerShell"}
function Set-Location-downloads {Set-Location "C:\Users\hurstc\Downloads"}

#endregion Navigation


function print-environment(){
    Write-Host "PSVersion: $($PSVersionTable.PSVersion.Major).$($PSVersionTable.PSVersion.Minor).$($PSVersionTable.PSVersion.Patch)"
    Write-Host "PSEdition: $($PSVersionTable.PSEdition)"
    Write-Host "Profile:   $PSCommandPath"
}


$vsbat              = 'C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\Tools\VsDevCmd.bat'
Function vscmd(){& cmd /k "$vsbat"}



function print-adminheader {

    $Host.UI.RawUI.WindowTitle = "PowerShell {0}" -f $PSVersionTable.PSVersion.ToString()
    if ($isAdmin)
    {
        $Host.UI.RawUI.WindowTitle += " [ADMIN]"
    }

}


function unzip ($file) {
    Write-Output("Extracting", $file, "to", $pwd)
    $fullFile = Get-ChildItem -Path $pwd -Filter $file | ForEach-Object { $_.FullName }
    Expand-Archive -Path $fullFile -DestinationPath $pwd
}

function find-file($name) {
	ls -recurse -filter "*${name}*" -ErrorAction SilentlyContinue | foreach {
		$place_path = $_.directory
		echo "${place_path}\${_}"
	}
}

function print-path {
	($Env:Path).Split(";")
}


# Functions

function gitCommit { & git commit $args }
function gitStatus { & git status -sb $args }
function gitcheckoutnewbranch { & git checkout -b $args }
function gitcheckoutmain { & git checkout main }
function gitcheckoutmaster { & git checkout master }
function gitPull { & git pull $args }
function gitAdd { & git add --all $args }
function gitFetch { & git fetch $args }
function gitPush { & git push $args }
function gitSwitch { & git switch $args }
function gitMerge { & git merge $args}
function gitMergeMain { & git merge main}
function gitStash { & git stash }
function gitClone { & git clone }

#