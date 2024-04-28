### Aliases ####################################################################
### System
alias update="trizen -Syu"
### Terminal
alias c="clear"                         # clear the terminal
### TMUX
alias tku="tmux ls -F'#{session_name}' | egrep '^[0-9]+$' |xargs -I% tmux kill-session -t \"=%\""
### ZSH
alias rc="omz reload"                   # reload the zsh config
alias ozc="$EDITOR $HOME/.zshrc"        # open the zsh config
### Bat
alias cat="bat"
### Editor
alias vim="lvim"                        # use lvim instead of vim
alias nvim="lvim"                       # use lvim instead of nvim
### Pass
alias pp="pass ff --no-copy"            # open fzf to search for passwords and print to console
alias pc="pass ff"                      # open fzf to search for passwords and copy to clipboard
### FZF
alias fp="fzf --preview 'bat'"          # use the fzf preview
### wd
alias wa="wd add"                       # add warp point
alias wl="wd list"                      # list warp points
################################################################################
