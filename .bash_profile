source ~/.profile

HOST_NAME=Olivers-MBP

# -------------------------------------
# environment
# -------------------------------------
export PATH=$PATH:$HOME/bin:/opt/apache-maven-3.6.3/bin

export JAVA_HOME=$(/usr/libexec/java_home)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export HISTSIZE=5000
export HISTFILESIZE=10000

shopt -s autocd
shopt -s histappend

# -------------------------------------
# bash history search with arrow keys
# -------------------------------------
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# ------------------------------
# prompt styling
# ------------------------------
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
bldgrn='\e[1;32m' # Bold Green
bldpur='\e[1;35m' # Bold Purple
txtrst='\e[0m'    # Text Reset

emojis=("👾" "🌱" "🥑" "🌍" "🐉" "🌵" "🍺")

EMOJI=${emojis[$RANDOM % ${#emojis[@]} ]}

print_before_the_prompt () {
    dir=$PWD
    home=$HOME
    dir=${dir/"$HOME"/"~"}
    printf "\n $txtred%s: $bldpur%s $txtgrn%s\n$txtrst" "$HOST_NAME" "$dir" "$(vcprompt)"
}

PROMPT_COMMAND=print_before_the_prompt
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
PS1="$EMOJI > "

# ------------------------------
# general aliases and functions
# ------------------------------
function mkcd() {
	mkdir $1 && cd $1
}

alias c='code .'
alias o="open ."
alias l="ls"
alias ll="ls -al"

# ----------------------
# yarn aliases
# ----------------------
alias y='yarn'
alias ys='yarn start'
alias ya='yarn add'
alias yr='yarn run'

# ----------------------
# npm aliases
# ----------------------
alias ns='npm start'
alias nr='npm run'
alias ni='npm i'
alias nis='npm i -S'

# ----------------------
# git aliases
# ----------------------
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add -A'
alias gc='git commit'
alias gcm='git commit -m'
alias gd='git diff'
alias gi='git init'
alias gl='git log'
alias gp='git pull'
alias gpsh='git push'
alias gss='git status -s'
alias gs='echo ""; echo "*********************************************"; echo -e "   DO NOT FORGET TO PULL BEFORE COMMITTING"; echo "*********************************************"; echo ""; git status'