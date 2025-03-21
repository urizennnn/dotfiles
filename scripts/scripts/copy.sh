list_files_with_two_extensions() {
    local dir_path=$1
    local ext1=$2
    local ext2=$3
    local exclude_dirs=("${@:4}")

    # Normalize excluded directories so we can match subpaths
    local exclude_dirs_set=()
    for dir in "${exclude_dirs[@]}"; do
        exclude_dirs_set+=("$(basename "$dir" | sed 's|/$||')")
    done

    local file_contents=""
    while IFS= read -r -d $'\0' file; do
        local exclude=false
        for dir in "${exclude_dirs_set[@]}"; do
            if [[ "$file" == */"$dir"/* ]]; then
                exclude=true
                break
            fi
        done

        if [ "$exclude" = false ] && { [[ "$file" == *"$ext1" ]] || [[ "$file" == *"$ext2" ]]; }; then
            file_contents+=$'\n'"$(printf "%s\n" "$file" | sed 's|^'"$dir_path"'/||')"  
            file_contents+=$'\n'"---------------------------------------------"
            file_contents+=$'\n'"$(cat "$file")"
            file_contents+=$'\n'"---------------------------------------------"
        fi
    done < <(find "$dir_path" -type f -print0)

    echo "$file_contents" | wl-copy
}

if [ "$#" -lt 3 ]; then
    echo "Usage: copy <directory_path> <file_extension1> <file_extension2> [excluded_dirs...]"
    exit 1
fi

dir_path=$1
file_ext1=$2
file_ext2=$3
shift 3
exclude_dirs=("$@")

list_files_with_two_extensions "$dir_path" "$file_ext1" "$file_ext2" "${exclude_dirs[@]}"

