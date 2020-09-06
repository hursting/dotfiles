
#-------------------------------------------------------------
# frequnly used apps
#-------------------------------------------------------------
alias e='explorer'
alias e.="explorer ."
alias lsql='docker container start pissoff'
alias lpsql='docker container start some-postgres'
alias codemeps='code /c:/Users/CHurst/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1'


#-------------------------------------------------------------
# Ls with funky colours
#-------------------------------------------------------------
# Add colors for filetype and  human-readable sizes by default on 'ls':
alias ls='ls -h --color'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.
alias cls='clear'		# clear stuff off screen and make same as powershell

#-------------------------------------------------------------
# Frequently used folders
#-------------------------------------------------------------
alias dev="cd /c/home/Dev"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias flow='cd /c/home/dev/repo/flow/asgflow/asg.core.web'
alias flow2='cd /c/home/dev/repo/FlowV2/FlowV2'
alias tools='cd C/ProgramData/chocolatey/lib'
alias home='cd /c/home/'
alias scripts='cd /c/home/dev/scripts'
alias flowu='cd /c/home/dev/repo/flow/FlowUserSettingPrototype/src'
alias projects='cd /c/home/dev/repo/projects'
alias repo='cd /c/home/dev/repo/flow'
alias tm='cd /c/home/dev/repo/ASGTicketApp'
alias setdev='setx ASPNETCORE_ENVIRONMENT "Development"'

#-------------------------------------------------------------
# various alias
#-------------------------------------------------------------
alias gh='history|grep'


#-------------------------------------------------------------
# docker alias
#-------------------------------------------------------------
alias dkp='docker system prune' 
alias dkl='docker ps -a'
alias dkl='docker system df'

# stop all docker containers
alias dkstop='docker stop $(docker ps -a -q)'
alias dkdelstop=' docker rm $(docker ps --filter status=exited -q) '



#-------------------------------------------------------------
# python alias
#-------------------------------------------------------------
alias pve='python3 -m venv ./venv'
alias pva='source ./venv/bin/activate'


#-------------------------------------------------------------
# dotnet commands
#-------------------------------------------------------------
alias dnud='dotnet ef database update'



#-------------------------------------------------------------
# chocolatey
#-------------------------------------------------------------
alias cko='choco outdated' #which ones are outdated
alias ckou='cup all -y' #upgrade all




# Quickly load bashrc
alias gogo='source ~/.bashrc'