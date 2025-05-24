if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
alias n='nano'
alias nv='nvim'
alias nvi='nvim'
alias nvconf='cd ~/.config/nvim/ && nvim . ; cd -'
source ~/.config/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source ~/.config/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' verbose yes
zstyle ':completion:*' group-name ''
autoload -Uz select-word-style
select-word-style bash
bindkey '\e[1;5C' forward-word      # Ctrl + Right
bindkey '\e[1;5D' backward-word     # Ctrl + Left
bindkey '\e[5C'    forward-word     # Alternate Ctrl + Right
bindkey '\e[5D'    backward-word    # Alternate Ctrl + Left
bindkey '^H' backward-kill-word
bindkey '^?' backward-delete-char  # fallback for normal backspace
bindkey '\e[3;5~' backward-kill-word
bindkey '\C-_'   undo               # Ctrl + _ for undo, if needed
export NVM_DIR="$HOME/.config/nvm"
function load_nvm() {
  unset -f nvm node npm pnpm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  unset -f load_nvm
}
for cmd in nvm node npm pnpm; do
  eval "$cmd() { load_nvm; $cmd \"\$@\"; }"
done
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

#eval "$(starship init zsh)"
