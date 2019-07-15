# ------
# Aliases
# ------
alias typora="open -a typora"
alias clr="clear" # Clear your terminal screen
alias flush="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder" # Flush DNS (macOS seria)
alias ip="curl icanhazip.com" # Your public IP address
alias ll="ls -1" # List all files in current directory in long list format
alias ldir="ls -al | grep ^d" # List all directories in current directory in long list format
alias o="open ." # Open the current directory in Finder

# ------
# Go Lang
# ------
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

# ...
