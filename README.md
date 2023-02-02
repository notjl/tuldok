# tuldok (dot) - dotfiles
**tuldok** is `dot` in English. This repository is intended to store and document the changes I do to customize my GNU/Linux experience.
It is ever changing and will depend on the whims of tako.

### Requirements
To start using the dotfiles, install these: [fastfetch](https://github.com/LinusDierheimer/fastfetch), [kitty](https://github.com/kovidgoyal/kitty), [neovim](https://github.com/neovim/neovim), [starship](https://github.com/starship/starship), and [zsh](https://zsh.sourceforge.io/).

### Neovim Requirements
Telescope plugin uses some binaries that it needs in order to run properly. The binaries are: [gcc](https://gcc.gnu.org/), [make](https://www.gnu.org/software/make/), 
[fd](https://github.com/sharkdp/fd), [ripgrep](https://github.com/BurntSushi/ripgrep), [Node.js](https://nodejs.org/en/)

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

### Additional Reads
In each dot directory, there is a README file for additional information of where did the inspiration or idea of this whole **tuldok** repository came from.

To ease the access of each of the README, consult the hyperlink below:
- [fastfetch README](./fastfetch/.config/fastfetch/README.md)
- [kitty README](./kitty/.config/kitty/README.md)
- [neovim README](./nvim/.config/nvim/README.md)
- [starship README](./starship/.config/starship/README.md)
- [zsh README](./zsh/.config/zsh/README.md)
