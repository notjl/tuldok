# Lines configured by zsh-newuser-install
HISTFILE="$XDG_STATE_HOME"/zsh/history
HISTSIZE=10000
SAVEHIST=10000
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
alias differ="git difftool --no-symlinks --dir-diff"

# Alias neovim to old vim
alias oldvim='\vim'
alias vim='nvim'
alias vi='nvim'
alias v='nvim'

# Alias webcam using mpv and /dev/video0
alias webcam="mpv /dev/video0"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Alias for pomodoro
# Based on bashbunni's pomodoro for MacOS. Instead of using terminal-notifier, make use of notify-send
# alias work="timer 45m -n 'Work' && notify-send 'Work Timer is up! Take a Break!' -a Pomodoro -i $HOME/Pictures/pomodoro.png \
#         ; paplay /usr/share/sounds/freedesktop/stereo/message-new-instant.oga"
# alias break="timer 10m -n 'Break' && notify-send 'Break Timer is over! Get back to work!' -a Pomodoro -i $HOME/Pictures/pomodoro.png \
#         ; paplay /usr/share/sounds/freedesktop/stereo/message-new-instant.oga"

function pomowork() (
    if uname -r | grep -q microsoft; then
        notify-send() {
            wsl-notify-send.exe --category $WSL_DISTRO_NAME "${@}"
        }
        timer 45m -n 'Work' && notify-send 'Work Timer is up! Take a Break!'
    else
        timer 45m -n 'Work' && notify-send 'Work Timer is up! Take a Break!'
        paplay /usr/share/sounds/freedesktop/stereo/message-new-instant.oga
    fi
)
function pomobreak() (
    if uname -r | grep -q microsoft; then
        notify-send() {
            wsl-notify-send.exe --category $WSL_DISTRO_NAME "${@}"
        }
        timer 10m -n 'Break' && notify-send 'Break Timer is over! Get back to work!'
    else
        timer 10m -n 'Break' && notify-send 'Break Timer is over! Get back to work!'
        paplay /usr/share/sounds/freedesktop/stereo/message-new-instant.oga
    fi
)

# Alias for reattaching and detaching GPU
# Based on blandman's laptop gpu passthrough guide'
# alias gpu-status='echo "NVIDIA Dedicated Graphics" | grep "NVIDIA" && lspci -nnk | grep "NVIDIA Corporation TU117M" -A 2 | grep "Kernel driver in use"'
# function gpu-to-host(){
#     if lspci -nnk | grep -q "Kernel driver in use: vfio-pci"; then
#         sudo virsh nodedev-reattach pci_0000_01_00_0 &> /dev/null
#         sudo rmmod vfio_pci vfio_pci_core vfio_iommu_type1 &> /dev/null
#         sudo modprobe -i nvidia_modeset nvidia_uvm nvidia_drm nvidia &> /dev/null
#     fi
# }
function gpu-switch() {
    if lspci -nk | grep -q "Kernel driver in use: nvidia"; then
        sudo rmmod nvidia_modeset nvidia_uvm nvidia_drm nvidia &> /dev/null
        echo "dGPU found... detaching..."
        echo "NVIDIA Drivers removed!"
        sudo modprobe -i vfio_pci vfio_pci_core vfio_iommu_type1 &> /dev/null
        echo "VFIO Drivers added!"
        sudo virsh nodedev-detach pci_0000_01_00_0 &> /dev/null
        sudo virsh nodedev-detach pci_0000_01_00_1 &> /dev/null
        echo "dGPU detached!"
        echo "dGPU is now VFIO ready!"
    else
        sudo virsh nodedev-reattach pci_0000_01_00_0 &> /dev/null
        sudo virsh nodedev-reattach pci_0000_01_00_1 &> /dev/null
        echo "dGPU not found... attaching..."
        echo "dGPU Attached!"
        sudo rmmod vfio_pci vfio_pci_core vfio_iommu_type1 &> /dev/null
        echo "VFIO Drivers removed!"
        sudo modprobe -i nvidia_modeset nvidia_uvm nvidia_drm nvidia &> /dev/null
        echo "NVIDIA Drivers added!"
        echo "dGPU is now host ready!"
    fi
}
# Octopus banner every terminal init
# echo "$(cat $ZDOTDIR/tako_banner)" | lolcat
fastfetch
# eval "$(zellij setup --generate-auto-start zsh)"
