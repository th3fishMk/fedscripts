#!/bin/bash
# chmod +x pending-git-actions.sh

echo "Scanning subdirectories in: $(pwd)"

for repo in */; do
    [ -d "$repo/.git" ] || continue # skip if not a git repo

    # Start the line for the repo
    printf "Current repo: %s" "$repo"

    (
        cd "$repo" || exit
        status_printed=0

        # Check for unstaged/uncommitted changes
        if ! git diff --quiet || ! git diff --cached --quiet; then
            printf " | \033[0;31mUnstaged/uncommitted changes\033[0m"
            status_printed=1
        fi

        # Check for un-pushed commits
        if git rev-parse --abbrev-ref --symbolic-full-name @{u} >/dev/null 2>&1; then
            if git rev-list --count --left-only @{u}...HEAD | grep -qv '^0$'; then
                printf " | \033[0;31mUn-pushed commits\033[0m"
                status_printed=1
            fi
        else
            if git rev-list --count HEAD | grep -qv '^0$'; then
                printf " | \033[0;31mUn-pushed commits (no remote)\033[0m"
                status_printed=1
            fi
        fi

        # If nothing was printed, indicate clean repo in green
        [ $status_printed -eq 0 ] && printf " | \033[0;32mclean\033[0m"
    )

    printf "\n"
done
