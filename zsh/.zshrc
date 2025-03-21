export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.cargo/bin/"
export PATH="/home/urizen/Documents/rust-analyzer-x86_64-unknown-linux-gnu:$PATH"

export KITTY_CONFIG_DIRECTORY=~/.config/kitty
export PATH=/usr/lib/jvm/java-23-openjdk/bin:$PATH
export STARSHIP_CONFIG="$HOME/.config/starship/config.toml"
export PATH="$HOME/.local/bin:/usr/local/bin:/usr/bin:/bin:$HOME/.cache/yay/bin:$HOME/bin:$HOME/.local/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
# Set environment variables
export ARCHFLAGS="-arch $(uname -m)"
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8

# History settings
HISTFILE=~/.zsh_history
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Enable command auto-correction
ENABLE_CORRECTION="true"

# Completion settings
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:zoxide_z:*' fzf-preview 'ls --color $realpath'


# User-specific configuration

# Set preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Aliases
alias run="cargo run"
alias so="source $HOME/.zshrc"
alias cfz="nvim $HOME/.zshrc"
alias .="nvim ."
alias pacman="sudo pacman --noconfirm"
alias anime="ani-cli"
alias yay="yay --noconfirm"
# alias fzf='fzf --preview "bat --color=always {}" | xargs nvim'
alias b="bat"
alias clear-ram="sudo $HOME/scripts/clear-ram.sh"
alias tmuxconf="nvim $HOME/.tmux.conf"
alias anime="ani-cli"
alias cls="clear"
alias get="$HOME/scripts/branch.sh"
alias copy="$HOME/scripts/copy.sh"
alias ollama="curl -fsSL https://ollama.com/install.sh | sh"
alias dpk="ollama run deepseek-r1:7b"
alias work-login="
gh auth logout
git config --global user.name 'consult-with-josh'
git config --global user.email ''
gh auth login
"
alias work-logout="
gh auth logout
git config --global user.name 'urizennnn'
git config --global user.email 'igamerryt@gmail.com'
gh auth login
"
alias Git="lazygit"
alias ginit="$HOME/scripts/init.sh"
alias del="trash-put"
alias cht="$HOME/scripts/cht.sh"
alias restore="trash-restore"
alias gitcfg="git config --list --global"
alias list="trash-list"
alias venv="$HOME/scripts/venv.sh"
alias empty="trash-empty"
alias zi="builtin cd -- "
alias convert="$HOME/scripts/convert-audio.sh"
alias zo="$HOME/scripts/zoxide_search.sh"
alias staging="mongosh 'mongodb+srv://avengers_assemble:yUjHaI59DgQkDvqn@subtrack.jukvj.mongodb.net/sub-staging?retryWrites=true&w=majority'"
alias sef="mongosh 'mongodb+srv://sefarvest:AlK7Kl8l8uD85IVN@cluster0.agqhxs8.mongodb.net/Sefarvest?retryWrites=true&w=majority'"

# Initialize Zoxide (to be executed after alias definition)
eval "$(zoxide init zsh)"

# Initialize other tools

eval "$(fzf --zsh)"
# Plugins configuration
plugins=(git zoxide fzf zsh-interactive-cd zsh-syntax-highlighting zsh-completions fzf-tab zsh-autosuggestions)

# Add zsh-completions to fpath
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

# Source Oh My Zsh again to apply plugins and settings
source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"
alias ls="eza  --long --no-filesize --icons=always --no-time --no-permissions --no-user"
eval "$(atuin init zsh)"
# NVM initialization
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# eval "$(op signin)"
# eval "$(/usr/bin/anaconda3/bin/conda shell.zsh hook)"

# pnpm
export PNPM_HOME="/home/urizen/.local/share/pnpm"
case ":$PATH:" in
  ":$PNPM_HOME:") ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
