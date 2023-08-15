### Exports ####################################################################
### Local
export LANG=de_DE.UTF-8                                 # set language
export PATH="$HOME/.local/bin:$PATH"                    # extend $PATH by local bin folder
### ZSH
export ZSH="$HOME/.config/.oh-my-zsh"                   # path to oh-my-zsh installation
export ZSH_CUSTOM="$HOME/.config/oh-my-zsh-custom"     # path to the oh-my-zsh custom folder
### SSH
if [[ -n $SSH_CONNECTION ]]; then                       # set local and remote editor
  export EDITOR='vim'                                   # vim for remote sessions
else
  export EDITOR='lvim'                                  # LunarVim for local editing
fi
### Node version manager
export NVM_DIR="$HOME/.nvm"                             # use nvm for managing nodejs
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
### Zettelkasten
export ZK_NOTEBOOK_DIR="$HOME/Dokumente/Notizen"        # export zettelkasten directory
### Applications
export BROWSER="chromium"                               # use chromium as default browser
export EMAIL="thunderbird"                              # use thunderbird as default mail client
export FILES="thunar"                                   # use thunar as default file browser
export TERMINAL="xfce4-terminal"                        # use xfce4 as default terminal
################################################################################

### Theming ####################################################################
ZSH_THEME="bullet-train"                                # use bullet-train zsh theme
BULLETTRAIN_PROMPT_ORDER=(
	dir                                                   # show cwd
	git                                                   # show git status
	status                                                # show exit codes
)
BULLETTRAIN_PROMPT_SEPARATE_LINE=false                  # don't wrap lines
BULLETTRAIN_STATUS_EXIT_SHOW=true                       # show exit codes
################################################################################

### Configuration ##############################################################
ENABLE_CORRECTION="true"                                # try to correct misspelled commands
COMPLETION_WAITING_DOTS="true"                          # show waiting dots for long listings
################################################################################

### Plugins ####################################################################
plugins=(
	git                                                   # keybinds for git
	tmux                                                  # keybinds for tmux
  # pass
  # wd
  # fzf
)
################################################################################

source $ZSH/oh-my-zsh.sh                                # source oh-my-zsh installation
source $ZSH_CUSTOM/aliases.zsh                          # source custom aliases
