# Ensure dependencies are sourced in the correct order

def zoxide-fzf-search [] {
    let selection = (zoxide query -ls | fzf --height=20 --reverse --preview ***REMOVED***ls {}***REMOVED***)
    if $selection != '' {
        cd $selection
    }
}
# Functions
def my-script [] {
    ($env.HOME | path join ***REMOVED***scripts/cht.sh***REMOVED*** | sh)
}

def convert-audio-script [] {
    ($env.HOME | path join ***REMOVED***scripts/convert-audio.sh***REMOVED*** | sh)
}

def zoxide-search-script [] {
    ($env.HOME | path join ***REMOVED***scripts/zoxide_search.sh***REMOVED*** | sh)
}

def zoxide-query-complete [] {
    zoxide query -ls | fzf --height=20 --reverse
}
def open-zshcon***REMOVED***g [] {
    nvim ($env.HOME | path join ***REMOVED***.zshrc***REMOVED***)
}

***REMOVED***
alias cls = clear
alias cfz = open-zshcon***REMOVED***g
alias zoi = zoxide-fzf-search
alias zc = zoxide-query-complete
alias z = zoxide
alias v = nvim .
 alias pacman = sudo pacman --nocon***REMOVED***rm
alias anime = ani-cli
alias ch = my-script
alias yay = yay --nocon***REMOVED***rm
alias b = bat
alias clear-ram = clear-ram
alias tmuxconf = tmuxconf
alias Git = lazygit
alias ginit = ginit 
alias del = trash-put
alias restore = trash-restore
alias list = trash-list
alias empty = trash-empty
alias convert = convert-audio-script
alias zo = zoxide-search-script

def clear-ram [] {
    sudo ($env.HOME | path join ***REMOVED***scripts/clear-ram.sh***REMOVED***)
}

def tmuxconf [] {
    nvim ($env.HOME | path join ***REMOVED***.tmux.conf***REMOVED***)
}

def ginit [] {
    ($env.HOME | path join ***REMOVED***scripts/init.sh***REMOVED***)
}

def del-trash [] {
    trash-put
}

def restore-trash [] {
    trash-restore
}

def list-trash [] {
    trash-list
}

def empty-trash [] {
    trash-empty
}
# Custom prompt and environment settings
def create_left_prompt [] {
    let dir = match (do --ignore-errors { $env.PWD | path relative-to $nu.home-path }) {
        null => $env.PWD
        '' => '~'
        $relative_pwd => ([~ $relative_pwd] | path join)
    }

    let path_color = (if (is-admin) { ansi red_bold } ***REMOVED*** { ansi green_bold })
    let separator_color = (if (is-admin) { ansi light_red_bold } ***REMOVED*** { ansi light_green_bold })
    let path_segment = $***REMOVED***($path_color)($dir)(ansi reset)***REMOVED***

    $path_segment | str replace --all (char path_sep) $***REMOVED***($separator_color)(char path_sep)($path_color)***REMOVED***
}

$env.PROMPT_COMMAND = {|| create_left_prompt }
$env.PROMPT_INDICATOR = {|| ***REMOVED***> ***REMOVED*** }
$env.PROMPT_INDICATOR_VI_INSERT = {|| ***REMOVED***: ***REMOVED*** }
$env.PROMPT_INDICATOR_VI_NORMAL = {|| ***REMOVED***> ***REMOVED*** }
$env.PROMPT_MULTILINE_INDICATOR = {|| ***REMOVED***::: ***REMOVED*** }
use std ***REMOVED***path add***REMOVED***


source ./atuin.nu
