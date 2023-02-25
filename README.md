# tuldok (dot) - dotfiles
**tuldok** is `dot` in English. This repository is intended to store and document the changes I do to customize my GNU/Linux experience.
It is ever changing and will depend on the whims of tako.

### Requirements
To start using the dotfiles, install these: [fastfetch](https://github.com/LinusDierheimer/fastfetch), [kitty](https://github.com/kovidgoyal/kitty),
[neovim](https://github.com/neovim/neovim), [starship](https://github.com/starship/starship), [zsh](https://zsh.sourceforge.io/),
[MangoHud](https://github.com/flightlessmango/MangoHud), [BetterDiscord](https://github.com/BetterDiscord/BetterDiscord),
and [btop](https://github.com/aristocratos/btop).

#### Neovim Requirements
[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) plugin uses some binaries that it needs in order to run properly. The binaries are: [gcc](https://gcc.gnu.org/), [make](https://www.gnu.org/software/make/), 
[fd](https://github.com/sharkdp/fd), [ripgrep](https://github.com/BurntSushi/ripgrep).

[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) plugin requires: [Node.js](https://nodejs.org/en/).

[null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) plugin requirements depends on the configured [BUILTINS](https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md).

> NOTE: You can always check the dependencies needed by the plugins by using `:checkhealth` in Vim

> NOTE: clipboard seems to work if [xsel](https://github.com/kfish/xsel)/[xclip](https://github.com/astrand/xclip) is installed, if on Wayland use: [wl-clipboard](https://github.com/bugaevc/wl-clipboard)

#### ZSH Requirements
In order to use `pomodoro` alias, install [timer](https://github.com/caarlos0/timer)

### Nerd Fonts
After installing the requirements, configure font family for the terminal emulator [kitty] by downloading a font from [Nerd Fonts](https://www.nerdfonts.com/) (preferably, Ubuntu Mono since kitty is configured to do so).
> If font is not Ubuntu Mono, you can configure the font family used by kitty by editing [font.conf](./kitty/.config/kitty/font.conf) and changing to your desired font by consulting `kitty +list-fonts`

### ZSH Environment
ZSH environment variables are configured to be stored inside the XDG compliant config directory, which in this case is located at `$HOME/.config/zsh/` or `$XDG_CONFIG_HOME`.

In order for your system to store and read from the `.zshenv` located at `$XDG_CONFIG_HOME`, you need to first edit the main `zshenv` that the system reads which is located at `/etc/zsh/zshenv`.
```
$ sudoedit /etc/zsh/zshenv

-- OR --

$ EDITOR="your choice text editor" sudoedit /etc/zsh/zshenv
```
And add this line:
```sh
export ZDOTDIR="$HOME"/.config/zsh
```
This defaults your zsh config directory at $HOME/.config/zsh

### Installation
The installation is rather primitive and makes use of [GNU Stow](https://www.gnu.org/software/stow/).
Once installed, you can then run it under terminal `sh install.sh`

### Additional Reads
In each dot directory, there is a README file for additional information of where did the inspiration or idea of this whole **tuldok** repository came from.

To ease the access of each of the README, consult the hyperlink below:
- [fastfetch README](./fastfetch/.config/fastfetch/README.md)
- [kitty README](./kitty/.config/kitty/README.md)
- [neovim README](./nvim/.config/nvim/README.md)
- [starship README](./starship/.config/starship/README.md)
- [zsh README](./zsh/.config/zsh/README.md)
