######################################
##### Aliases
######################################
alias ll='ls -lar'

######################################
##### Shell Colours
######################################
# Magic exports for simple thing - colours for dirs & files 
export CLICOLOR='true'
export LSCOLORS="gxfxcxdxbxegedabagacad"

######################################
##### Environments (e.g. DEV, UAT, PROD)
######################################
txtred=$(tput setaf 1)
txtylw=$(tput setaf 3)
txtgrn=$(tput setaf 2)
txtblu=$(tput setaf 4)
txtrev=$(tput rev)
txtbld=$(tput bold)
txtrst=$(tput sgr0)

ps1_DEV="[\u@\h:\[${txtbld}${txtblu}\]DEV\[${txtrst}\]:\w] $ "
ps1_UAT="[\u@\h:\[${txtbld}${txtblu}\]UAT\[${txtrst}\]:\w] $ "
ps1_PROD="[\u@\h:\[${txtbld}${txtblu}\]PROD\[${txtrst}\]:\w] $ "

export PS1=$ps1_DEV

