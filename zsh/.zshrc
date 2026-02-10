export PATH=$PATH:$HOME/.cargo/bin
export ZSH="$HOME/.oh-my-zsh"

# NODE
export NVM_DIR="$HOME/.nvm"
nvm() {
  if [ -s "$NVM_DIR/nvm.sh" ]; then
    source "$NVM_DIR/nvm.sh"
    echo "nvm initialized"
    nvm "$@"
  else
    command nvm "$@"
  fi
}

plugins=(git)
ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh

# User configuration
## Vi mode
set -o vi
bindkey '^R' history-incremental-search-backward # NOTE: re-binding it because vi mode overwrites it
## if SSH:
if [[ -n $SSH_CONNECTION ]]; then
  PROMPT='%F{red}[SSH]%f %n@%m %~ %# '
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
## Aliases
alias restart-waybar="killall -SIGUSR2 waybar"
alias set-wallpaper="~/.config/hypr/change_wallpaper.sh"
alias set-temperature="hyprctl hyprsunset temperature $1"

lfcd () {
  # `command` is needed because `lfcd` is aliased to `lf`
  cd "$(command lf -print-last-dir "$@")"
}
alias lf='lfcd'

alias unreal="~/Linux_Unreal_Engine_5.5.1/Engine/Binaries/Linux/UnrealEditor"
alias syncthing="/opt/syncthing/syncthing"

alias iphone-mount='idevicepair pair && ifuse ~/mnt/iphone && echo "iPhone mounted at ~/mnt/iphone"'
alias iphone-unmount='fusermount -uz ~/mnt/iphone && echo "iPhone unmounted"'
