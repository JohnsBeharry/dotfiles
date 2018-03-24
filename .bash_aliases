# list files
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# open apps
alias sublime=/opt/sublime_text/sublime_text

# git compare
alias git-compare-='git merge-base --is-ancestor origin/develop $(git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3); echo $?'
