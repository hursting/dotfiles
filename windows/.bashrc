#!/bin/bash
source ~/.shells/alias.sh
source ~/.shells/functions.sh
source ~/.shells/git.sh
complete -C C:\ProgramData\chocolatey\lib\terraform\tools\terraform.exe terraform.exe
export CONDUIT_SECRET='ThisIsReallySecret'
export FLASK_DEBUG=1