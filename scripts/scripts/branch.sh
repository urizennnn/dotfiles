#!/bin/bash


GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color


print_color() {
    echo -e ***REMOVED***${1}${2}${NC}***REMOVED***
}


if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    print_color $YELLOW ***REMOVED***Error: Not a git repository. Please run this script from within a git repository.***REMOVED***
    exit 1
***REMOVED***


print_color $GREEN ***REMOVED***Fetching updates from all remotes...***REMOVED***
git fetch --all


remote_branches=$(git branch -r | grep -v '\->' | sed ***REMOVED***s/\s*origin\///g***REMOVED***)


for branch in $remote_branches
do

    if git show-ref --verify --quiet refs/heads/$branch; then
        print_color $YELLOW ***REMOVED***Branch '$branch' already exists locally. Updating...***REMOVED***
        git checkout $branch
        git pull origin $branch
    ***REMOVED***
        print_color $GREEN ***REMOVED***Creating new local branch '$branch'...***REMOVED***
        git checkout -b $branch origin/$branch
    ***REMOVED***
done

print_color $GREEN ***REMOVED***All remote branches have been fetched and updated locally.***REMOVED***


original_branch=$(git rev-parse --abbrev-ref HEAD)
git checkout $original_branch

print_color $GREEN ***REMOVED***Switched back to '$original_branch' branch.***REMOVED***
print_color $GREEN ***REMOVED***Script completed successfully!***REMOVED***
