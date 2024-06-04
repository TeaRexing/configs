### Exports ####################################################################
### Local
export LANG=de_DE.UTF-8                                 # set language
export PATH="$HOME/Scripts:$HOME/.local/bin:$PATH"                    # extend $PATH by local bin folder
### ZSH
export ZSH="$HOME/.config/.oh-my-zsh"                   # path to oh-my-zsh installation
export ZSH_CUSTOM="$HOME/.config/oh-my-zsh-custom"     	# path to the oh-my-zsh custom folder
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
export BROWSER="firefox"                                # use firefox as default browser
export EMAIL="thunderbird"                              # use thunderbird as default mail client
export FILES="thunar"                                   # use thunar as default file browser
export TERMINAL="xfce4-terminal"                        # use xfce4 as default terminal
### Pass
export PASSWORD_STORE_ENABLE_EXTENSIONS=true
### ChatGPT
source ~/.privateEnv
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
  pass                                                  # easier usage of pass
  wd                                                    # add extension for war points
  fzf                                                   # use fzf to fuzzy search for directories/files and command history
)
################################################################################

### Always start a tmux-session
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ "screen-*" ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

source $ZSH/oh-my-zsh.sh                                # source oh-my-zsh installation
source $ZSH_CUSTOM/aliases.zsh                          # source custom aliases
