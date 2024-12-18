# Fastfetch
fastfetch

# Set Zsh theme
ZSH_THEME=***REMOVED***robbyrussell***REMOVED***

# Path to your Oh My Zsh installation.
***REMOVED***

# Update PATH to include custom directories
***REMOVED***

***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***

***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***

***REMOVED***
***REMOVED***

***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***


***REMOVED***

***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***

***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
alias pacman=***REMOVED***sudo pacman --nocon***REMOVED***rm***REMOVED***
***REMOVED***
alias yay=***REMOVED***yay --nocon***REMOVED***rm***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
alias Git=***REMOVED***lazygit***REMOVED***
alias ginit=***REMOVED***$HOME/scripts/init.sh***REMOVED***
alias del=***REMOVED***trash-put***REMOVED***
alias restore=***REMOVED***trash-restore***REMOVED***
alias list=***REMOVED***trash-list***REMOVED***
alias venv=***REMOVED***$HOME/scripts/venv.sh***REMOVED***
alias empty=***REMOVED***trash-empty***REMOVED***
alias convert=***REMOVED***$HOME/scripts/convert-audio.sh***REMOVED***
alias zo=***REMOVED***$HOME/scripts/zoxide_search.sh***REMOVED***

# Initialize Zoxide (to be executed after alias de***REMOVED***nition)
eval ***REMOVED***$(zoxide init zsh)***REMOVED***

***REMOVED***

eval ***REMOVED***$(fzf --zsh)***REMOVED***
# Plugins con***REMOVED***guration
plugins=(git zoxide fzf archlinux gh history zsh-interactive-cd zsh-syntax-highlighting zsh-completions fzf-tab zsh-autosuggestions web-search)

***REMOVED***
***REMOVED***

***REMOVED***
***REMOVED***

alias ls=***REMOVED***eza  --long --no-***REMOVED***lesize --icons=always --no-time --no-permissions --no-user***REMOVED***
eval ***REMOVED***$(atuin init zsh)***REMOVED***
***REMOVED***
export NVM_DIR=***REMOVED***$HOME/.nvm***REMOVED***
[ -s ***REMOVED***$NVM_DIR/nvm.sh***REMOVED*** ] && \. ***REMOVED***$NVM_DIR/nvm.sh***REMOVED***  # This loads nvm
[ -s ***REMOVED***$NVM_DIR/bash_completion***REMOVED*** ] && \. ***REMOVED***$NVM_DIR/bash_completion***REMOVED***  # This loads nvm bash_completion
