# shellcheck disable=SC2148
# This file is sourced at ~/.bashrc
# if [ -f /path/to/this/file ]; then
#     . /path/to/this/file
# fi

# [ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)" # SSH stuff

# Aliases
alias repos='cd /mnt/repos'
alias repos-fish='cd /mnt/repos/th3fishMk'
alias repos-scrawl='cd /mnt/repos/und3rscrawl'
alias rsrc="source ~/.bashrc"
alias sysup='sudo dnf update ; echo "+++ dnf done updating :D" ; flatpak update ; echo "+++ flatpak done updating :D"'

# Exports
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools
export PATH="/mnt/repos/th3fishMk/fedscripts/scripts:$PATH"

fastfetch
echo "Done!"
