# Lines configured by zsh-newuser-install
HISTFILE="$XDG_STATE_HOME"/zsh/history
HISTSIZE=1000
SAVEHIST=5000
setopt notify
unsetopt beep

# Vi mode
bindkey -v

# ZSH Syntax Highlighting + Autosuggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Coloured list
alias ls="ls --color"

# Change cursor shape for different vi modes
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} == '' ]] ||
       [[ $1 = 'line' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
  zle -K viins
  echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[1 q' # Default to block cursor
preexec() { echo -ne '\e[1 q' ;} # Use block cursor on each new prompt

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tako/.zshrc'

autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
# End of lines added by compinstall

# Use vim keys in tab completion menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Initiate Starship
eval "$(starship init zsh)"


# Kitty aliases
alias icat="kitty +kitten icat"
alias d="kitty +kitten diff"

# Alias neovim to old vim
alias oldvim='\vim'
alias vim='nvim'
alias vi='nvim'
alias v='nvim'

# Octopus banner every terminal init
# echo "$(cat $ZDOTDIR/tako_banner)" | lolcat
echo 
fastfetch
