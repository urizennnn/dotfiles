# Configuration for fzf preview
set-env FZF_TAB_PREVIEW "exa --tree --level=2 --color=always {}"

# Helper function to fuzzy find files
def fzf-find-file [] {
    ls
    | get name
    | to text
    | fzf --preview $env.FZF_TAB_PREVIEW
}

# Helper function to fuzzy find directories
def fzf-find-dir [] {
    ls
    | where type == "dir"
    | get name
    | to text
    | fzf --preview $env.FZF_TAB_PREVIEW
}

# Custom completion for cd command
def "nu-complete cd" [] {
    fzf-find-dir
}

# Custom completion for open command
def "nu-complete open" [] {
    fzf-find-file
}

# Define custom fcd function (fuzzy cd)
def fcd [dir] {
    if ($dir == null) {
        cd (nu-complete cd)
    } else {
        cd $dir
    }
}

# Define custom fopen function (fuzzy open)
def fopen [file] {
    if ($file == null) {
        open (nu-complete open)
    } else {
        open $file
    }
}

# Function to fuzzy search through command history
def fzf-history [] {
    history
    | get command
    | uniq
    | reverse
    | str join (char newline)
    | fzf --height 40% --layout=reverse
    | str trim
}

# Bind Ctrl+R to history search
$env.config = ($env.config | upsert keybindings [{
    name: history_search
    modifier: control
    keycode: char_r
    mode: [emacs, vi_normal, vi_insert]
    event: { send: "executeCapturedShell: (fzf-history)" }
}])

# Function to fuzzy search through environment variables
def fzf-env [] {
    $env
    | columns
    | to text
    | fzf
    | str trim
    | if ($in != "") { $env | get $in }
}

# Function to fuzzy search through running processes
def fzf-ps [] {
    ps
    | to text
    | fzf --height 40% --layout=reverse
    | str trim
}

# Convenience functions (instead of aliases)
def fcd-cmd [] {
    fcd (nu-complete cd)
}

def fopen-cmd [] {
    fopen (nu-complete open)
}

# Bind fcd and fopen as convenience functions
$env.config = ($env.config | upsert keybindings [{
    name: fcd
    modifier: control
    keycode: char_d
    event: { send: executeCapturedShell: "(fcd-cmd)" }
}])

$env.config = ($env.config | upsert keybindings [{
    name: fopen
    modifier: control
    keycode: char_o
    event: { send: executeCapturedShell: "(fopen-cmd)" }
}])

