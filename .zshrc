# Uncomment for startup stats
#zmodload zsh/zprof

# Path to your oh-my-zsh installation.
export ZSH="/Users/rdb676/.oh-my-zsh"

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

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PYENV_ROOT/shims:$PATH"

alias ll="colorls -la --sd --gs"
alias awseast="export AWS_DEFAULT_REGION=us-east-1"
alias awswest="export AWS_DEFAULT_REGION=us-west-2"
alias awsdev="export AWS_DEFAULT_PROFILE=GR_GG_COF_AWS_STS_Dev_Developer; export AWS_PROFILE=GR_GG_COF_AWS_STS_Dev_Developer"
alias awsprod="AWS_DEFAULT_PROFILE=GR_GG_COF_AWS_STS_Prod_ReadOnly; AWS_PROFILE=GR_GG_COF_AWS_STS_Prod_ReadOnly"
alias tokens="~/SecurityTokenScript --no-proxy"

source ~/.gpconfig


# AWS stuff
export AWS_DEFAULT_PROFILE=GR_GG_COF_AWS_STS_Dev_Developer
export AWS_PROFILE=GR_GG_COF_AWS_STS_Dev_Developer
export AWS_DEFAULT_REGION=us-east-1

export PATH=/usr/local/opt/openssl/bin:"$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"

source <(inv --print-completion-script zsh)

# will break colorls if removed
eval "$(rbenv init -)"
source $(dirname $(gem which colorls))/tab_complete.sh

# uncomment for startup stats
# zprof

function diff {
    colordiff -u "$@"
}
newtext=green
oldtext=red
diffstuff=cyan

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true
