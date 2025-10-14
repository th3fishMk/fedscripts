# shellcheck disable=SC2148
# .aliases
# This file is sourced at ~/.bashrc
# if [ -f /mnt/repos/th3fishMk/linux-settings/profile ]; then
#     . /mnt/repos/th3fishMk/linux-settings/profile
# fi

fastfetch

alias repos='cd /mnt/repos'
alias rsrc="source ~/.bashrc"
alias sysup='sudo dnf update ; echo "+++ dnf done updating :D" ; flatpak update ; echo "+++ flatpak done updating :D"'
# [ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)" # SSH stuff

echo "Done!"
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools

export PATH="/mnt/repos/fish/th3fishMk/linux-settings/scripts:$PATH"
