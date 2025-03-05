
Set-Alias -Name nguid -Value Set-guid
Set-Alias -Name tail -Value get_tail
Set-Alias -Name head -Value get_head
Set-Alias -Name o -Value start


Set-Alias -Name ll -Value Get-ChildItem
Set-Alias -Name cl -Value clear
Set-Alias -Name fp -Value findprocess
Set-Alias -Name grep -Value Select-String






# Launch applications
Set-Alias -Name lnp -Value 'C:\Program Files\Notepad++\notepad++.exe'
Set-Alias -Name lpm -Value 'C:\Users\hurstc\AppData\Local\Postman\Postman.exe'
Set-Alias -Name lff -Value 'C:\Program Files\Mozilla Firefox\firefox.exe' 
Set-Alias -Name lsqlm -Value "C:\Program Files (x86)\Microsoft SQL Server Management Studio 20\Common7\IDE\Ssms.exe"
Set-Alias -Name lc -Value "C:\Program Files\Microsoft VS Code\Code.exe"
Set-Alias -Name lvs -Value "$vs2022"
Set-Alias -Name laz -Value Start-Azurite


# Nav
Set-Alias -Name exp -Value Set-Explorer-Here
Set-Alias -Name mkcd -Value CreateAndSet-Directory
Set-Alias -Name cdhome -Value Set-Location-home 
Set-Alias -Name cdrepo -Value Set-Location-repo
Set-Alias -Name cddesktop -Value Set-Location-desktop
Set-Alias -Name cddump -Value Set-Location-dump
Set-Alias -Name cdprofile -Value l
Set-Alias -Name pp -Value print-path
Set-Alias -Name ff -Value find-file
Set-Alias -Name cddownloads -Value Set-Location-downloads

# profile and env
Set-Alias -Name gogo -Value reloadprofile
Set-Alias -Name env -Value Get-Environment -Option AllScope
Set-Alias -Name ep -Value Edit-Profile


# checks
Set-Alias -Name checksf -Value checksalesforceruns
Set-Alias -Name checkmfiles -Value checkmfilespending

# checks


#Git
Set-Alias -Name ga -Value gitAdd
Set-Alias -Name gpu -Value gitPush
Set-Alias -Name gpl -Value gitPull
Set-Alias -Name gmm -Value gitMerge
Set-Alias -Name gma -Value gitMergeMain
Set-Alias -Name gf -Value gitFetch
Set-Alias -Name gs -Value gitStatus
Set-Alias -Name gsw -Value gitSwitch
Set-Alias -Name gst -Value gitStash
Set-Alias -Name gcl -Value gitClone
Set-Alias -Name gcom -Value gitcheckoutmaster
Set-Alias -Name gcoma -Value gitcheckoutmain
Set-Alias -Name gcob -Value gitcheckoutnewbranch
Set-Alias -Name gtc -Value gitCommit



Function gettoken-test-params {GetToken -key "TEST"}
Function gettoken-prod-params {GetToken -key "PROD"}
Function gettoken-uat-params {GetToken -key "UAT"}

Set-Alias -Name ttoken -Value gettoken-test-params
Set-Alias -Name utoken -Value gettoken-uat-params
Set-Alias -Name ptoken -Value gettoken-prod-params
