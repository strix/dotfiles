# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# export EDITOR=vim
export EDITOR=nvim

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
case `uname` in
  Darwin)
    # commands for OS X go here
    export EDITOR=mvim
  ;;
  Linux)
    # commands for Linux go here
    # export EDITOR=gvim
    if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
      source /etc/profile.d/vte.sh
    fi
  ;;
esac

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="af-magic"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ssh-agent zsh-autosuggestions zsh-syntax-highlighting)
# plugins=(git ssh-agent zsh-autosuggestions zsh-vim-mode)

# MODE_CURSOR_VIINS="#00ff00 blinking bar"
# MODE_CURSOR_REPLACE="$MODE_CURSOR_VIINS #ff0000"
# MODE_CURSOR_VICMD="green block"
# MODE_CURSOR_SEARCH="#ff00ff steady underline"
# MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD steady bar"
# MODE_CURSOR_VLINE="$MODE_CURSOR_VISUAL #00ffff"

# MODE_INDICATOR_VIINS='%F{15}<%F{8}INSERT<%f'
# MODE_INDICATOR_VICMD='%F{10}<%F{2}NORMAL<%f'
# MODE_INDICATOR_REPLACE='%F{9}<%F{1}REPLACE<%f'
# MODE_INDICATOR_SEARCH='%F{13}<%F{5}SEARCH<%f'
# MODE_INDICATOR_VISUAL='%F{12}<%F{4}VISUAL<%f'
# MODE_INDICATOR_VLINE='%F{12}<%F{4}V-LINE<%f'

# VIM_MODE_ESC_PREFIXED_WANTED='bdfhul.g'

# VIM_MODE_INITIAL_KEYMAP=last

# setopt PROMPT_SUBST
# # Note the single quotes
# RPS1='${MODE_INDICATOR_PROMPT} ${vcs_info_msg_0_}'

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

if [ -f ~/.zsh_aliases ]; then
	. ~/.zsh_aliases
fi

#so as not to be disturbed by Ctrl-S ctrl-Q in terminals:
stty -ixon

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# npm global directory
export PATH=~/.npm-global/bin:$PATH

# n directory
export N_PREFIX=$HOME/.n
export PATH=$N_PREFIX/bin:$PATH

# other env vars
export GOPATH=$HOME/go
export PATH=${GOPATH//://bin:}/bin:$PATH

# virtualenvwrapper stuffs
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/workspace
source "$(command -v virtualenvwrapper.sh)"

# fzf stuffs
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*" --glob "!node_modules/*" --glob "!dist/*" --glob "!build/*" --glob "!venv/*"'

# rust stuffs
export PATH=$HOME/.cargo/bin:$PATH
