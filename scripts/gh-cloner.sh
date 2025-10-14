#!/bin/bash
# Usage: ./clone_all_repos.sh <github-username> [destination-dir]

USER=${1:?Please provide a GitHub username}
DEST=${2:-$PWD} # Default to current directory

mkdir -p "$DEST"

# Fetch all repository names of the user
repos=$(gh repo list "$USER" --limit 1000 --json name,sshUrl -q '.[].sshUrl')

if [ -z "$repos" ]; then
    echo "No repositories found for user: $USER"
    exit 1
fi

echo "Cloning repositories of $USER into $DEST"

# Loop through URLs and clone
for repo_url in $repos; do
    git clone "$repo_url" "$DEST/$(basename "$repo_url" .git)"
done
