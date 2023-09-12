### Aliases ####################################################################
### System
alias update="trizen -Syu"
### Terminal
alias c="clear"                         # clear the terminal
### TMUX
alias tku="tmux ls -F'#{session_name}' | egrep '^[0-9]+$' |xargs -I% tmux kill-session -t \"=%\""
### ZSH
alias rc="omz reload"                   # reload the zsh config
### Editor
alias vim="lvim"                        # use lvim instead of vim
alias nvim="lvim"                        # use lvim instead of nvim
### Pass
alias pc="pass clip"                    # open fzf to search for passwords
################################################################################
