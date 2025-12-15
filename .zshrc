if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh


# Zsh configuration
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"

# Python
alias dock="docker compose"
alias dockdb="docker compose exec postgres psql -U postgres -d zewa"
alias dockdbtest="docker compose exec postgres psql -U postgres-tests -d zewa"
dockexec() {
  local CONTAINERID=$(docker ps -aqf "name=$1"); 
  echo "Executing: $1 '$CONTAINERID'";
  docker exec -u root -t -i $CONTAINERID /bin/sh;
}

# Python
alias prpm="poetry run python manage.py"

# Node.js
alias dev="npm run start:dev"
alias start="npm run start"

# Projects directories
alias lua="cd ~/.config/nvim/lua"
alias tune="cd ~/projects/tune-vault"
alias tuneui="cd ~/projects/tune-vault-ui"
alias tuneex="cd ~/projects/tune-vault-extension/"
alias zewa="cd ~/work/zewa-backend/"
alias zewab="cd ~/work/zewa-frontend/"
alias zewac="cd ~/work/zewa-customer/"
alias motics="cd ~/work/motics-clinic-web-nextjs/"
alias email="cd ~/work/motics-email-agent-nextjs/"
alias mvmt="cd ~/work/bsdmvmtltd/"
alias notes="nvim ~/Documents/notes"

alias servicebus="cd ~/work/azure-service-bus-emulator-installer/ServiceBus-Emulator/Scripts/Mac"

# Git commands
alias gun="git reset --soft HEAD~1" 
alias glst="git log -1 --pretty=%B | awk 'BEGIN{ORS=\"\"} {print}' | pbcopy"
gdf() {
  git diff "$@" |
  git-split-diffs --color |
  less -RFX;
}

crf() { 
	mkdir -p "$(dirname "$1")" &&
	touch "$1";
  local Green='\033[0;32m';
  local NoColor='\033[0m';
  echo "${Green}Successfully created a new file at $1";
}
crn() {
  mkdir -p "$(dirname "$1")" &&
  touch "$1" &&
  nvim "$1";
}
crz() {
  mkdir -p "$(dirname "$1")" &&
  touch "$1" &&
  zed "$1";
}

# Default commands override
alias ls="eza --icons --oneline"
# Find files
alias inv='nvim $(fzf -m --preview="bat --color=always {}")'

eval "$(/opt/homebrew/bin/brew shellenv)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


POWERLEVEL9K_MODE="nerdfont-complete"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


function cherry() {
    git cherry-pick $1
    GMESSAGE=$(git log -1 --pretty=%B)
    git reset HEAD~1
    git add .
    git commit -n -m $GMESSAGE
}
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

bindkey -v


export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yehor/work/motics-tmp-files/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/yehor/work/motics-tmp-files/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/yehor/work/motics-tmp-files/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/yehor/work/motics-tmp-files/google-cloud-sdk/completion.zsh.inc'; fi
