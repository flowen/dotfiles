
#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####

# Path to your oh-my-zsh installation.
export ZSH="/Users/flowflow/.oh-my-zsh"

# OPEN AI API KEY
export OPENAI_API_KEY=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

# See ~/.aws/credentials for profiles
#export AWS_PROFILE="flowen"

# fixes up- and downarrow. See: https://apple.stackexchange.com/a/290671
#export HISTSIZE=100000

# This loads nvm.sh and sets the correct PATH before running hook
export NPX_DIR="$HOME/.npx"
[ -s "$NPX_DIR/npx.sh" ] && \. "$NPX_DIR/npx.sh"

#set to current user so agnoster theme will ignore, type 'whoami' to find your username
DEFAULT_USER="flowflow"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="wezm"  
#ZSH_THEME="theunraveler"  
ZSH_THEME="powerlevel10k/powerlevel10k"  

# Add `~/bin` to the `$PATH`
# export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles, and then some:
for file in ~/.{exports,aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
	source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

export UPDATE_ZSH_DAYS=13

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions 
  zsh-syntax-highlighting 
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='mvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

bindkey "^[[3~" delete-char

export NVM_DIR="$HOME/.nvm"
 [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
 [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# autoload .nvmrc
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

#add-zsh-hook chpwd load-nvmrc
#load-nvmrc

# adds a time and date on the right-hand-side of the terminal
# source: https://gist.github.com/zulhfreelancer/9c410cad5efa9c5f7c74cd0849765865
#RPROMPT='%{$fg[magenta]%}$(git_prompt_info)%{$reset_color%}'
#TMOUT=1
#TRAPALRM() {
#    if [ "$WIDGET" != "complete-word" ]; then
#        zle reset-prompt
#    fi
#} 

# export MONGO_PATH=/usr/local/mongodb
# export PATH=$PATH:$MONGO_PATH/binexport PATH="/usr/local/opt/gnu-getopt/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

# transfer.sh function: transfer hello.txt
#transfer(){ if [ $# -eq 0 ];then echo "No arguments specified.\nUsage:\n transfer <file|directory>\n ... | transfer <file_name>">&2;return 1;fi;if tty -s;then file="$1";file_name=$(basename "$file");if [ ! -e "$file" ];then echo "$file: No such file or directory">&2;return 1;fi;if [ -d "$file" ];then file_name="$file_name.zip" ,;(cd "$file"&&zip -r -q - .)|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null,;else cat "$file"|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;else file_name=$1;curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;}


export PNPM_HOME="/Users/flowflow/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
export PATH=/usr/local/opt/python/libexec/bin:$PATH
export PATH="/usr/local/sbin:$PATH"

# to fix ffmpeg
export DYLD_LIBRARY_PATH=/usr/local/Cellar/mbedtls/3.4.0/lib:$DYLD_LIBRARY_PATH

export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOBIN
export PATH=$PATH:$GOROOT/bin

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/flowflow/_DATA/DOWNLOADS/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/flowflow/_DATA/DOWNLOADS/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/flowflow/_DATA/DOWNLOADS/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/flowflow/_DATA/DOWNLOADS/google-cloud-sdk/completion.zsh.inc'; fi

# Created by `pipx` on 2024-08-23 08:45:41
export PATH="$PATH:/Users/flowflow/.local/bin"


export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

