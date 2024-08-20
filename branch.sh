#!/bin/bash


GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color


print_color() {
    echo -e "${1}${2}${NC}"
}


if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    print_color $YELLOW "Error: Not a git repository. Please run this script from within a git repository."
    exit 1
fi


print_color $GREEN "Fetching updates from all remotes..."
git fetch --all


remote_branches=$(git branch -r | grep -v '\->' | sed "s/\s*origin\///g")


for branch in $remote_branches
do

    if git show-ref --verify --quiet refs/heads/$branch; then
        print_color $YELLOW "Branch '$branch' already exists locally. Updating..."
        git checkout $branch
        git pull origin $branch
    else
        print_color $GREEN "Creating new local branch '$branch'..."
        git checkout -b $branch origin/$branch
    fi
done

print_color $GREEN "All remote branches have been fetched and updated locally."


original_branch=$(git rev-parse --abbrev-ref HEAD)
git checkout $original_branch

print_color $GREEN "Switched back to '$original_branch' branch."
print_color $GREEN "Script completed successfully!"
