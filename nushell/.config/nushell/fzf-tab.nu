# Con***REMOVED***guration for fzf preview
set-env FZF_TAB_PREVIEW ***REMOVED***exa --tree --level=2 --color=always {}***REMOVED***

# Helper function to fuzzy ***REMOVED***nd ***REMOVED***les
def fzf-***REMOVED***nd-***REMOVED***le [] {
    ls
    | get name
    | to text
    | fzf --preview $env.FZF_TAB_PREVIEW
}

# Helper function to fuzzy ***REMOVED***nd directories
def fzf-***REMOVED***nd-dir [] {
    ls
    | where type == ***REMOVED***dir***REMOVED***
    | get name
    | to text
    | fzf --preview $env.FZF_TAB_PREVIEW
}

# Custom completion for cd command
def ***REMOVED***nu-complete cd***REMOVED*** [] {
    fzf-***REMOVED***nd-dir
}

# Custom completion for open command
def ***REMOVED***nu-complete open***REMOVED*** [] {
    fzf-***REMOVED***nd-***REMOVED***le
}

# De***REMOVED***ne custom fcd function (fuzzy cd)
def fcd [dir] {
    if ($dir == null) {
        cd (nu-complete cd)
    } ***REMOVED*** {
        cd $dir
    }
}

# De***REMOVED***ne custom fopen function (fuzzy open)
def fopen [***REMOVED***le] {
    if ($***REMOVED***le == null) {
        open (nu-complete open)
    } ***REMOVED*** {
        open $***REMOVED***le
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
$env.con***REMOVED***g = ($env.con***REMOVED***g | upsert keybindings [{
    name: history_search
    modi***REMOVED***er: control
    keycode: char_r
    mode: [emacs, vi_normal, vi_insert]
    event: { send: ***REMOVED***executeCapturedShell: (fzf-history)***REMOVED*** }
}])

# Function to fuzzy search through environment variables
def fzf-env [] {
    $env
    | columns
    | to text
    | fzf
    | str trim
    | if ($in != ***REMOVED******REMOVED***) { $env | get $in }
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
$env.con***REMOVED***g = ($env.con***REMOVED***g | upsert keybindings [{
    name: fcd
    modi***REMOVED***er: control
    keycode: char_d
    event: { send: executeCapturedShell: ***REMOVED***(fcd-cmd)***REMOVED*** }
}])

$env.con***REMOVED***g = ($env.con***REMOVED***g | upsert keybindings [{
    name: fopen
    modi***REMOVED***er: control
    keycode: char_o
    event: { send: executeCapturedShell: ***REMOVED***(fopen-cmd)***REMOVED*** }
}])

