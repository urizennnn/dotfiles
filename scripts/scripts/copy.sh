list_***REMOVED***les_with_two_extensions() {
    local dir_path=$1
    local ext1=$2
    local ext2=$3
    local exclude_dirs=(***REMOVED***${@:4}***REMOVED***)

    # Normalize excluded directories so we can match subpaths
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

        if [ ***REMOVED***$exclude***REMOVED*** = false ] && { [[ ***REMOVED***$***REMOVED***le***REMOVED*** == ****REMOVED***$ext1***REMOVED*** ]] || [[ ***REMOVED***$***REMOVED***le***REMOVED*** == ****REMOVED***$ext2***REMOVED*** ]]; }; then
            ***REMOVED***le_contents+=$'\n'***REMOVED***$(printf ***REMOVED***%s\n***REMOVED*** ***REMOVED***$***REMOVED***le***REMOVED*** | sed 's|^'***REMOVED***$dir_path***REMOVED***'/||')***REMOVED***  
            ***REMOVED***le_contents+=$'\n'***REMOVED***---------------------------------------------***REMOVED***
            ***REMOVED***le_contents+=$'\n'***REMOVED***$(cat ***REMOVED***$***REMOVED***le***REMOVED***)***REMOVED***
            ***REMOVED***le_contents+=$'\n'***REMOVED***---------------------------------------------***REMOVED***
        ***REMOVED***
    done < <(***REMOVED***nd ***REMOVED***$dir_path***REMOVED*** -type f -print0)

    echo ***REMOVED***$***REMOVED***le_contents***REMOVED*** | wl-copy
}

if [ ***REMOVED***$#***REMOVED*** -lt 3 ]; then
    echo ***REMOVED***Usage: copy <directory_path> <***REMOVED***le_extension1> <***REMOVED***le_extension2> [excluded_dirs...]***REMOVED***
    exit 1
***REMOVED***

dir_path=$1
***REMOVED***le_ext1=$2
***REMOVED***le_ext2=$3
shift 3
exclude_dirs=(***REMOVED***$@***REMOVED***)

list_***REMOVED***les_with_two_extensions ***REMOVED***$dir_path***REMOVED*** ***REMOVED***$***REMOVED***le_ext1***REMOVED*** ***REMOVED***$***REMOVED***le_ext2***REMOVED*** ***REMOVED***${exclude_dirs[@]}***REMOVED***

