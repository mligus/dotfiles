# .dotfiles aka configs

This repository is a collection of configs and scripts I use (or used) to run my development environments.


## Links

  * https://medium.com/risan/upgrade-your-ssh-key-to-ed25519-c6e8d60d3c54
  * https://github.com/ycm-core/YouCompleteMe
  * https://github.com/ycm-core/YouCompleteMe#linux-64-bit
  * https://github.com/neovim/neovim/wiki/Installing-Neovim
  * https://ohmyz.sh/#install
  * https://github.com/spaceship-prompt/spaceship-prompt
  * https://github.com/spaceship-prompt/spaceship-prompt#oh-my-zsh
  * https://github.com/powerline/fonts
  * https://github.com/powerline/fonts/blob/master/Meslo%20Dotted/Meslo%20LG%20M%20DZ%20Regular%20for%20Powerline.ttf
  * https://www.rust-lang.org/learn/get-started
  * https://github.com/junegunn/fzf#installation
  * https://github.com/sharkdp/bat
  * https://github.com/BurntSushi/ripgrep
  * https://the.exa.website/
  * https://github.com/pyenv/pyenv-installer
  * https://github.com/TheAssassin/AppImageLauncher/wiki/Install-on-Ubuntu-or-Debian


## Post-Installation Steps

> Following steps were last ran on PopOS! 21.04


### Generate good SSH key:

```bash
ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519 -C "<login>@<hostname>"
```


### Udate system and install required packages:

Add NeoVim PPA to install latest version:

```bash
sudo add-apt-repository ppa:neovim-ppa/stable
```

```bash
sudo apt update && sudo apt upgrade
```

```bash
sudo apt install -y neovim python3-neovim \
                    zsh powerline fonts-powerline fzf tmux zsh \
                    git curl make build-essential libssl-dev zlib1g-dev \
                    libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
                    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev 
```

### Global Git config:

```bash
git config --global user.name "Max Ligus"
git config --global user.email "max.ligus@gmail.com"
git config --global core.editor /usr/bin/nvim
```

Download `.gitignore` from GitHub repo:

```bash
curl -fsSL https://raw.githubusercontent.com/mligus/dotfiles/master/git/.gitignore_global -o $HOME/.gitignore_global
```


### Update alternative editors:

```bash
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --skip-auto --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --skip-auto --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --skip-auto --config editor
```


### Install [Oh-My-Zsh](https://ohmyz.sh/#install):

Install OnMyZsh:

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

And Spaceship theme:

```bash
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```

> Add a new Profile to the Terminal app and set font to [Meslo](https://github.com/powerline/fonts/blob/master/Meslo%20Dotted/Meslo%20LG%20M%20DZ%20Regular%20for%20Powerline.ttf). 
> Do the same for Sublime Text editor.


### Install Rust and few more tools:

Install Rust:
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

To configure your current shell, run:
```bash
source $HOME/.cargo/env
```

Install tools:
```bash
cargo install exa
cargo install bat
cargo install ripgrep
```


### Install Python, pyenv and other related stuff:

Install Pyenv:
```bash
curl https://pyenv.run | bash
```

Install specific Python version:
```bash
pyenv install 3.9.10
```


### Copy config from GitHub:

```bash
curl -fsSL https://raw.githubusercontent.com/mligus/dotfiles/main/zsh/.zshrc -o $HOME/.zshrc

curl -fsSL https://raw.githubusercontent.com/mligus/dotfiles/main/other/.profile -o $HOME/.profile
cp $HOME/.profile $HOME/.zprofile
```


### NeoVim config

```bash
sudo apt install build-essential cmake python3-dev

mkdir -p $HOME/.config/nvim/
curl -fsSL https://raw.githubusercontent.com/mligus/dotfiles/master/nvim/init.vim -o $HOME/.config/nvim/init.vim

curl -fsSLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qa

pyenv virtualenv 3.9.7 nvim3
pyenv activate nvim3
pip install --upgrade pip
pip install neovim
pyenv deactivate
```

Install (build) YouCompleteMe:

```bash
cd .config/nvim/plugged/youcompleteme
python3 install.py --clangd-completer --rust-completer
```


### Tmux config

```bash
curl -fsSL https://raw.githubusercontent.com/mligus/dotfiles/main/tmux/.tmux.conf -o $HOME/.tmux.conf
```

### Install AppImageLauncher

```bash
sudo add-apt-repository ppa:appimagelauncher-team/stable
sudo apt update
sudo apt install appimagelauncher
```


## Extras

  * Install Sublime Text - https://www.sublimetext.com/docs/linux_repositories.html
  * Install Nextcloud Client - https://nextcloud.com/install/
  * Install Todoist app - https://todoist.com/downloads
  * Install Joplin - https://joplinapp.org/help/#desktop-applications
  * Install Material Shell (tiling WM) - https://github.com/material-shell/material-shell
