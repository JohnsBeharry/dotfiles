alias git-compare-='git merge-base --is-ancestor origin/develop $(git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3); echo $?'
