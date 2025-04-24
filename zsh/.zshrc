# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
#
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
 export ZSH="/Users/overmartinez/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	vscode
	zsh-syntax-highlighting
	zsh-autosuggestions
)

# ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Config
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias sshar="eval "$(ssh-agent -s)" | cut -d ' ' -f3 | xargs kill -9"
# alias src="omz reload"
alias src="source ~/.zshrc"

# TMUX
alias t="tmux"
alias td="tmux detach"
alias tn="tmux new -s"
alias tl="tmux ls"
alias to="tmux attach -t"
alias c='clear; tmux clear-history; clear'

## Native commands
alias ll="eza --color=always --long --git --icons=always"
alias man="tldr"
alias cd="z"
alias grep="rg"
alias tree="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions --tree"
alias cat="bat"

## NVIM
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias vimconfig="code ~/.config/nvim/init.vim"
alias vimrc="code ~/.vimrc"

## Yarn
alias y="yarn"
alias yi="yarn install"
alias ya="yarn add"
alias yga="yarn global add"
alias yad="yarn add --dev"
alias ys="yarn start"
alias yd="yarn run dev"
alias yt="yarn test"
alias yr="yarn run"
alias yrm="yarn remove"
alias yc="yarn create"
alias yrl="yarn run lint"
alias yrlf="yarn run lint --fix"
alias yu="yarn upgrade-interactive"
alias yx="yarn dlx"

## NPM
alias nr="npm run"
alias ni="npm install"

## NVM
alias n8="nvm use 6"
alias n8="nvm use 8"
alias n10="nvm use 10"
alias n12="nvm use 12"
alias n13="nvm use 13"
alias n14="nvm use 14"
alias n16="nvm use 16"
alias n17="nvm use 17"
alias n18="nvm use 18"
alias n20="nvm use 20"

## Docker compose
alias doc="docker "
alias docp="docker-compose "
alias docup="docker-compose up"
alias docupd="docker-compose up -d"
alias docpd="docker-compose down"
alias apitest="docker-compose up test"
alias apicover="docker-compose up cover"

## Dorectories
alias p="cd ~/Projects"
alias oma="cd ~/Projects/OMA"
alias oma="cd ~/Projects/OMA/"
alias foma="cd ~/Projects/OMA/omafinances"
alias woma="cd ~/Projects/OMA/wareman"
alias blix="cd ~/Projects/blixter/"
alias firm="cd ~/Projects/blixter/firmare-front"
alias over="cd ~/Projects/overmartinez"

### Git
alias grlc="git reset HEAD~1 --mixed"
alias gsma="git submodule add"
alias gsmu="git submodule update"
alias gsmi="git submodule init"
alias gsmui="submodule update --init --recursive"
alias gstam="git stash push -m"
alias gst="git status -u"

### Git hub-flow
alias ghf="git-hf"
alias ghfi="git-hf init"
alias ghfl="git-hf pull"
alias ghfp="git-hf push"
alias ghff="git-hf feature"
alias ghffs="git-hf feature start"
alias ghffc="git-hf feature checkout"
alias ghfff="git-hf feature finish"
alias ghfr="git-hf release"
alias ghfrs="git-hf release start"
alias ghfrf="git-hf release finish"

### K8s
alias aksfirmaretest="export KUBECONFIG=/Users/overmartinez/kubeconfig.eastus.json"

### Electron
alias eb="electron-builder"

### Apps
alias jmeter="sh /Users/overmartinez/Projects/apache-jmeter-5.2.1/bin/jmeter.sh"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

# source /usr/local/share/powerlevel10k/powerlevel10k.zsh-theme

### Export to jmeter, it need java 15
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-15.jdk/Contents/Home/

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$PATH:/Users/overmartinez/flutter/bin"

export NVM_DIR="/Users/overmartinez/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# bun completions
[ -s "/Users/overmartinez/.bun/_bun" ] && source "/Users/overmartinez/.bun/_bun"

PATH=~/.console-ninja/.bin:$PATH
PATH=~/.local/bin:$PATH

## Init Starship shell (This replace oh-my-zsh)
eval "$(starship init zsh)"


# ---- FZF ----

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# --- setup fzf theme ---
fg="#CBE0F0"
bg="#011628"
bg_highlight="#143652"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"

# --- Use fd instead of the fzf default find command ---
export FZF_DEFAULT_COMMAND='fd --hidden --strip-cwd-prefix --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd for listing path candidates
_fzf_compgen_path() {
	fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
	fd --type=d --hidden --exclude .git . "$1"
}
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --level=2 --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --level=2 --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# Use FZF for listing git files
source ~/fzf-git.sh/fzf-git.sh

# --- Bat Theme ---
export BAT_THEME="TwoDark"
# export BAT_THEME="tokyonight_night"

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

## Drop git commits with fzf
unalias grc 2>/dev/null
grc() {
  local commit=$(git log --oneline --color=always | fzf --ansi --no-sort --reverse \
    --preview='git show --color=always $(echo {} | awk "{print \$1}")' \
    --preview-window=down:70%)

  if [[ -z "$commit" ]]; then
    echo "🤷‍♂️ No commit selected"
    return 1
  fi

  local hash=$(echo "$commit" | awk '{print $1}')
  echo "All commits after $hash (the selected one) will be dropped."
  read "confirm?Are you sure? [y/N] "

  if [[ "$confirm" != [yY] ]]; then
    echo "🙅‍♂️ Aborted."
    return 1
  fi

  git reset --mixed "$hash"
}
