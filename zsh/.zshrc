### Exports ####################################################################
### Local
export LANG=de_DE.UTF-8                                   # set language
export PATH="$HOME/.local/bin:/usr/bin/python:$PATH"      # extend $PATH by local bin folder and python
### ZSH
export ZSH="$HOME/.config/.oh-my-zsh"                     # path to oh-my-zsh installation
export ZSH_CUSTOM="$HOME/.config/oh-my-zsh-custom"       	# path to the oh-my-zsh custom folder
### SSH
if [[ -n $SSH_CONNECTION ]]; then                         # set local and remote editor
  export EDITOR='vim'                                     # vim for remote sessions
else
  export EDITOR='lvim'                                    # LunarVim for local editing
fi
### Node version manager
export NVM_DIR="$HOME/.nvm"                               # use nvm for managing nodejs
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
### Zettelkasten
export ZK_NOTEBOOK_DIR="$HOME/Dokumente/Notizen"          # export zettelkasten directory
### Applications
export BROWSER="firefox"                                  # use firefox as default browser
export EMAIL="thunderbird"                                # use thunderbird as default mail client
export FILES="thunar"                                     # use thunar as default file browser
export TERMINAL="xfce4-terminal"                          # use xfce4 as default terminal
### Pass
export PASSWORD_STORE_ENABLE_EXTENSIONS=true
### ChatGPT
source ~/.privateEnv
### Ruby
export GEM_HOME="$HOME/.gems"                             # use local gems
export PATH="$HOME/.gems/bin:$PATH"                       # extend $PATH by local gems
export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin" # use ruby 3.0
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
  npm                                                   # use npm for managing nodejs
)
################################################################################

### Always start a tmux-session
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ "screen-*" ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

source $ZSH/oh-my-zsh.sh                                # source oh-my-zsh installation
source $ZSH_CUSTOM/aliases.zsh                          # source custom aliases
