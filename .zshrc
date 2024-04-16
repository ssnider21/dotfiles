# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Uncomment for startup stats
#zmodload zsh/zprof

# Path to your oh-my-zsh installation.
export ZSH="/Users/seansnider/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
#source ~/zshrc_extensions/spaceship_theme

#ENABLE_CORRECTION="true"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

#autoload -U promptinit; promptinit
#prompt pure

ZSH_AUTOSUGGEST_STRATEGY=match_prev_cmd

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#export PATH="$PYENV_ROOT/shims:$PATH"
export PATH=$PATH:/opt/apache-maven/bin

export EDITOR=vim


#alias ll="colorls -la --sd --gs"
alias ll="exa --long --git --icons -a --group-directories-first"
alias vim='mvim -v'

alias short='python ~/shorten.py'
alias col='python ~/scripts/colors/colored_text.py'

function css () {
    cd "$@" && ll
}

alias cd="css"

#source <(inv --print-completion-script zsh)

# will break colorls if removed
#eval "$(rbenv init -)"
#source $(dirname $(gem which colorls))/tab_complete.sh

# uncomment for startup stats
# zprof

#function diff {
    #colordiff -u "$@"
#}
newtext=green
oldtext=red
diffstuff=cyan

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
if which pyenv-virtualenv-init > /dev/null;
  then eval "$(pyenv virtualenv-init -)"
fi
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/seansnider/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/seansnider/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/seansnider/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/seansnider/google-cloud-sdk/completion.zsh.inc'; fi

# bun completions
[ -s "/Users/seansnider/.bun/_bun" ] && source "/Users/seansnider/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
