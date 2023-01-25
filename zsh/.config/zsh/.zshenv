# Export environment variables for fcitx5
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus

# Change EDITOR variable defaulting to VI/VIM/NeoVIM
export EDITOR="/usr/bin/nvim"

# XDG compliant directory
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# Change ZSH config location and any related ZSH config
export ZDOTDIR=$HOME/.config/zsh
export HISTFILE="$XDG_STATE_HOME"/zsh/history

# Change WINE dotfile
export WINEPREFIX="$XDG_DATA_HOME"/wine

# Change GTK config location
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

# Change Golang location
export GOPATH="$XDG_DATA_HOME"/go

# Change CUDA location
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
