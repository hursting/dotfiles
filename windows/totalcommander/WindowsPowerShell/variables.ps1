#variables

$vs2022              ="C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE\devenv.exe"
$currentPaths       = $env:PSModulePath
$localmodulespath   = "C:\home\ps\modules"
$actualhome         ="C:\home"
$vsinstall          ="C:\Program Files\Microsoft Visual Studio\2022\Professional\"
$env:VSINSTALLDIR = $vsinstall
$env:PSModulePath += ";C:\home\ps\modules"

#if (-not ($env:PSModulePath -split ";" | ForEach-Object { $_.Trim() } | -contains $localmodulespath)) {
#    $env:PSModulePath += ";$localmodulespath"
#} 


#https://gist.github.com/apfelchips/62a71500a0f044477698da71634ab87b
if (-not $env:DESKTOP_DIR) { $env:DESKTOP_DIR = Join-Path -Path "$HOME" -ChildPath "desktop" }; $DESKTOP_DIR = $env:DESKTOP_DIR
if (-not $env:REPO_DIR) { $env:REPO_DIR = Join-Path -Path "$actualhome" -ChildPath "repo" }; $REPO_DIR = $env:REPO_DIR
if (-not $env:DUMP_DIR) { $env:DUMP_DIR = Join-Path -Path "$actualhome" -ChildPath "dump" }; $DUMP_DIR = $env:DUMP_DIR
