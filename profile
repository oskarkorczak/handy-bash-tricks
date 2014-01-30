# Aliases you're always lacking on new, linuxish machine
alias ll='ls -lar'

# Magic exports for simple thing - colours for dirs & files 
export CLICOLOR='true'
export LSCOLORS="gxfxcxdxbxegedabagacad"

# GIT KURWA
# Git branch in prompt.
parse_git_branch() {
   git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Most wanted Git current branch aware prompt 
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
