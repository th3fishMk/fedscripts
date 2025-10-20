# shellcheck disable=SC2148
# This file is sourced at ~/.bashrc with the following lines
# if [ -f /path/to/this/file ]; then
#     . /path/to/this/file
# fi
# This is my personal custom bashrc
# The way I like, the way I enjoy.

# [ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)" # SSH stuff

#
# Enable incremental history search with up/down arrows
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
# Save more history lines
HISTSIZE=10000
HISTFILESIZE=20000

# Append to history instead of overwriting
shopt -s histappend

# Save after each command (so multiple terminals share history)
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Aliases
alias repos='cd /mnt/repos'
alias rsrc="source ~/.bashrc"
alias sysup='sudo dnf update ; echo "+++ dnf done updating :D" ; flatpak update ; echo "+++ flatpak done updating :D"'

# Exports
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools
export PATH="/mnt/repos/th3fishMk/fedscripts/scripts:$PATH"

parse_git_branch() {
    git rev-parse --is-inside-work-tree &>/dev/null || return

    branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
    toplevel=$(git rev-parse --show-toplevel 2>/dev/null) || return
    repo_name=$(basename "$toplevel")
    relpath=$(git rev-parse --show-prefix 2>/dev/null)

    # build local path
    if [ -z "$relpath" ]; then
        localpath="${repo_name}/"
    else
        localpath="${repo_name}/${relpath}"
    fi

    # determine state
    if ! git diff --quiet 2>/dev/null || ! git diff --quiet --cached 2>/dev/null; then
        state="dirty"
        symbol="✗"
    elif [ -n "$(git log --branches --not --remotes 2>/dev/null)" ]; then
        state="unpushed"
        symbol="↑"
    else
        state="clean"
        symbol="✓"
    fi

    echo "$branch|$localpath|$state|$symbol"
}

# shellcheck disable=SC2154
export PS1='\[\033[0;32m\]\u@\h\[\033[0m\]:\[\033[0;34m\]\W\[\033[0m\]$(\
info=$(parse_git_branch); \
if [ -n "$info" ]; then \
    IFS="|" read -r branch prefix state symbol <<< "$info"; \
    if [ "$state" = "dirty" ]; then color="\[\033[0;31m\]"; \
    elif [ "$state" = "unpushed" ]; then color="\[\033[0;33m\]"; \
    else color="\[\033[0;32m\]"; fi; \
    echo " ${color}(${branch} ${symbol} | ${prefix})\[\033[0m\]"; \
fi) \$ '

fastfetch
echo "Done!"
