# This file is sourced at ~/.bashrc
# echo "sourcing '/mnt/repos/th3fishMk/linux-settings/profile.sh'"
echo "Doing the things"
fastfetch

[ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)"
alias repos='cd /mnt/repos'
