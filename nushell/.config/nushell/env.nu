# Ensure dependencies are sourced in the correct order

def zoxide-fzf-search [] {
    let selection = (zoxide query -ls | fzf --height=20 --reverse --preview "ls {}")
    if $selection != '' {
        cd $selection
    }
}
# Functions
def my-script [] {
    ($env.HOME | path join "scripts/cht.sh" | sh)
}

def convert-audio-script [] {
    ($env.HOME | path join "scripts/convert-audio.sh" | sh)
}

def zoxide-search-script [] {
    ($env.HOME | path join "scripts/zoxide_search.sh" | sh)
}

def zoxide-query-complete [] {
    zoxide query -ls | fzf --height=20 --reverse
}
def open-zshconfig [] {
    nvim ($env.HOME | path join ".zshrc")
}

def switch_shell [] {
    /usr/bin/zsh
}

def vps [] {
    ssh urizen@138.197.128.225
}

# Aliases
alias cls = clear
alias vps = vps
alias switch = switch_shell
alias cfz = open-zshconfig
alias zoi = zoxide-fzf-search
alias zc = zoxide-query-complete
alias z = zoxide
alias v = nvim .
 alias pacman = sudo pacman --noconfirm
alias anime = ani-cli
alias ch = my-script
alias yay = yay --noconfirm
alias b = bat
alias clear-ram = clear-ram
alias tmuxconf = tmuxconf
alias Git = lazygit
alias ginit = ginit 
alias _ = sudo
alias del = trash-put
alias restore = trash-restore
alias list = trash-list
alias empty = trash-empty
alias convert = convert-audio-script
alias lzd = lazydocker
alias zo = zoxide-search-script

def clear-ram [] {
    sudo ($env.HOME | path join "scripts/clear-ram.sh")
}

def tmuxconf [] {
    nvim ($env.HOME | path join ".tmux.conf")
}

def ginit [] {
sh    ($env.HOME | path join "scripts/init.sh")
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

    let path_color = (if (is-admin) { ansi red_bold } else { ansi green_bold })
    let separator_color = (if (is-admin) { ansi light_red_bold } else { ansi light_green_bold })
    let path_segment = $"($path_color)($dir)(ansi reset)"

    $path_segment | str replace --all (char path_sep) $"($separator_color)(char path_sep)($path_color)"
}

$env.PROMPT_COMMAND = {|| create_left_prompt }
$env.PROMPT_INDICATOR = {|| "> " }
$env.PROMPT_INDICATOR_VI_INSERT = {|| ": " }
$env.PROMPT_INDICATOR_VI_NORMAL = {|| "> " }
$env.PROMPT_MULTILINE_INDICATOR = {|| "::: " }
use std "path add"


$env.STARSHIP_CONFIG = "/home/urizen/.config/starship/config.toml"
$env.EDITOR = "nvim"


path add /usr/bin/golangci-lint
mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
zoxide init nushell | save -f ~/.config/nushell/zoxide.nu
