#!/bin/bash

# Script to ***REMOVED***nd every single ***REMOVED***le and opens in neovim
# alias set as nzo in .zshrc
search_with_zoxdie() {
    if [ -z ***REMOVED***$1***REMOVED*** ]; then
        # use fd with fzf to select & open a ***REMOVED***le when no arg are provided
        ***REMOVED***le=***REMOVED***$(fd --type f -I -H -E .git -E .git-crypt -E .cache -E .backup | fzf --height=70% --preview='bat -n --color=always --line-range :500 {}')***REMOVED***
        if [ -n ***REMOVED***$***REMOVED***le***REMOVED*** ]; then
            nvim ***REMOVED***$***REMOVED***le***REMOVED***
        ***REMOVED***
    ***REMOVED***
        # Handle when an arg is provided
        lines=$(zoxide query -l | xargs -I {} fd --type f -I -H -E .git -E .git-crypt -E .cache -E .backup -E .vscode ***REMOVED***$1***REMOVED*** {} | fzf --no-sort) # Initial ***REMOVED***lter attempt with fzf
        line_count=***REMOVED***$(echo ***REMOVED***$lines***REMOVED*** | wc -l | xargs)***REMOVED*** # Trim any leading spaces

        if [ -n ***REMOVED***$lines***REMOVED*** ] && [ ***REMOVED***$line_count***REMOVED*** -eq 1 ]; then
            # looks for the exact ones and opens it
            ***REMOVED***le=***REMOVED***$lines***REMOVED***
            nvim ***REMOVED***$***REMOVED***le***REMOVED***
        elif [ -n ***REMOVED***$lines***REMOVED*** ]; then
            # If multiple ***REMOVED***les are found, allow further selection using fzf and bat for preview
            ***REMOVED***le=$(echo ***REMOVED***$lines***REMOVED*** | fzf --query=***REMOVED***$1***REMOVED*** --height=70% --preview='bat -n --color=always --line-range :500 {}')
            if [ -n ***REMOVED***$***REMOVED***le***REMOVED*** ]; then
                nvim ***REMOVED***$***REMOVED***le***REMOVED***
            ***REMOVED***
        ***REMOVED***
            echo ***REMOVED***No matches found.***REMOVED*** >&2
        ***REMOVED***
    ***REMOVED***
}

search_with_zoxdie ***REMOVED***$@***REMOVED***
