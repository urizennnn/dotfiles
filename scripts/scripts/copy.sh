
#!/bin/bash

list_***REMOVED***les_with_extension() {
    local dir_path=$1
    local ***REMOVED***le_ext=$2
    local exclude_dirs=(***REMOVED***${@:3}***REMOVED***)

    local exclude_dirs_set=()
    for dir in ***REMOVED***${exclude_dirs[@]}***REMOVED***; do
        exclude_dirs_set+=(***REMOVED***$(basename ***REMOVED***$dir***REMOVED*** | sed 's|/$||')***REMOVED***)
    done

    local ***REMOVED***le_contents=***REMOVED******REMOVED***
    while IFS= read -r -d $'\0' ***REMOVED***le; do
        local exclude=false
        for dir in ***REMOVED***${exclude_dirs_set[@]}***REMOVED***; do
            if [[ ***REMOVED***$***REMOVED***le***REMOVED*** == */***REMOVED***$dir***REMOVED***/* ]]; then
                exclude=true
                break
            ***REMOVED***
        done

        if [ ***REMOVED***$exclude***REMOVED*** = false ] && [[ ***REMOVED***$***REMOVED***le***REMOVED*** == ****REMOVED***$***REMOVED***le_ext***REMOVED*** ]]; then
            ***REMOVED***le_contents+=$'\n'***REMOVED***$(printf ***REMOVED***%s\n***REMOVED*** ***REMOVED***$***REMOVED***le***REMOVED*** | sed 's|^'***REMOVED***$dir_path***REMOVED***'/||')***REMOVED***  
            ***REMOVED***le_contents+=$'\n'***REMOVED***---------------------------------------------***REMOVED***
            ***REMOVED***le_contents+=$'\n'***REMOVED***$(cat ***REMOVED***$***REMOVED***le***REMOVED***)***REMOVED***
            ***REMOVED***le_contents+=$'\n'***REMOVED***---------------------------------------------***REMOVED***
        ***REMOVED***
    done < <(***REMOVED***nd ***REMOVED***$dir_path***REMOVED*** -type f -print0)

    
    echo ***REMOVED***$***REMOVED***le_contents***REMOVED*** | wl-copy
}

if [ ***REMOVED***$#***REMOVED*** -lt 2 ]; then
    echo ***REMOVED***Usage: copy <directory_path> <***REMOVED***le_extension> [excluded_dir1] [excluded_dir2] ...***REMOVED***
***REMOVED***
    dir_path=$1
    ***REMOVED***le_ext=$2
    shift 2
    exclude_dirs=(***REMOVED***$@***REMOVED***)
    list_***REMOVED***les_with_extension ***REMOVED***$dir_path***REMOVED*** ***REMOVED***$***REMOVED***le_ext***REMOVED*** ***REMOVED***${exclude_dirs[@]}***REMOVED***
***REMOVED***
