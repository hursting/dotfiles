#-------------------------------------------------------------
# Git Commands
#-------------------------------------------------------------

# Add and Commit are used as functions
alias gpo='git push origin master'
alias gp='git pull'
alias gs='git status'
alias gd='git diff'
alias gr='git reflog'
alias gls='git ls-files'
alias gpp='git push'
alias ga='git add'
alias gb='git br'  
alias gdc='git diff --cached' 
alias gl='git log'  
alias gst='git stash' 
alias gpom='git pull origin master'
alias gbv='git branch -vv' 
alias gcm='git checkout master'
alias gcd='git checkout develop'
alias gcob='git checkout -b'

alias gh='git help '

# Useful when working on a branch and 
# want to summarize changes against master
alias gdmno='git diff master  --name-only'



#-------------------------------------------------------------
# Git Flow:
#-------------------------------------------------------------

function gff(){
	git flow feature $1 $2
}

function gfb(){
	git flow bugfix $1 $2
}

function gfh(){
	git flow hotfix $1 $2
}

#-------------------------------------------------------------
# Git:
#-------------------------------------------------------------

function co(){
	git checkout $1
}

#--- git add --------
function ga(){
    git-add $1
}

function gi(){
    git-add --interactive
}



function gf() {
	git fetch
}


#--- git push ---
function gpsuo(){
    git push --set-upstream origin $1
}



function gc(){
    git commit -m "$*"
}



#--- git log ---
function gl1() {
	git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %b %Cgreen(%cd) %C(bold blue)<%an>%Creset" --abbrev-commit
}


function gll() {
	git log --graph --date-order -C -M --pretty=format:"<%h> %ad [%an] %Cgreen%d%Creset %s" --date=short
}

function glx() {
	git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %Cgreen(%cd) %C(bold blue) %an [%ae]:%Creset %n %s %n %b %n" --abbrev-commit
}

function grootall(){
	for i in */.git; do ( echo $i; cd $i/..; git pull; ); done
}
