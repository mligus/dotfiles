# .dotfiles aka configs

This repository is a collection of configs and scripts I use (or used) to run my development environments.


## First Steps

> Following steps were last ran on PopOS! 21.04


1. Generate good SSH key:

```bash
ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519 -C "<login>@<hostname>"
```

Links:
  * https://medium.com/risan/upgrade-your-ssh-key-to-ed25519-c6e8d60d3c54


2. Install packages:

```bash
sudo apt update

sudo apt install -y neovim python3-neovim \
                    zsh powerline fonts-powerline fzf

sudo apt install gnome-tweaks
```

3. Global Git config:

```bash
git config --global user.name "Max Ligus"
git config --global user.email "max.ligus@gmail.com"
git config --global core.editor /usr/bin/nvim

curl -fsSL https://raw.githubusercontent.com/mligus/dotfiles/master/git/.gitignore_global -o $HOME/.gitignore_global
```


4. Update alternative editors:

```bash
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --skip-auto --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --skip-auto --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --skip-auto --config editor
```


3. Install [Oh-My-Zsh](https://ohmyz.sh/#install):

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

curl -fsSL https://raw.githubusercontent.com/mligus/dotfiles/main/zsh/.zshrc -o $HOME/.zshrc

curl -fsSL https://raw.githubusercontent.com/mligus/dotfiles/main/other/.profile -o $HOME/.profile
```

Add a new Profile to the Terminal app and set font to [Meslo](https://github.com/powerline/fonts/blob/master/Meslo%20Dotted/Meslo%20LG%20M%20DZ%20Regular%20for%20Powerline.ttf). Do the same for Sublime Text editor.


4. Install Rust and few more tools:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

cargo install exa
cargo install bat
cargo install ripgrep
```


5.  Install Python, pyenv and other related stuff:

```bash
sudo apt install make build-essential libssl-dev zlib1g-dev \
         libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
         libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
```

```bash
curl https://pyenv.run | bash
pyenv install 3.9.7
```

Links:
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


6. NeoVim config:

```bash
sudo apt install build-essential cmake python3-dev

mkdir -p $HOME/.config/nvim/
curl -fsSL https://raw.githubusercontent.com/mligus/dotfiles/master/nvim/init.vim -o $HOME/.config/nvim/init.vim

curl -fsSLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sed -i 's/^colorscheme/" colorscheme/g' $HOME/.config/nvim/init.vim
vim +PlugInstall +qa
sed -i 's/^" colorscheme/colorscheme/g' $HOME/.config/nvim/init.vim


pyenv virtualenv 3.9.7 nvim3
pyenv activate nvim3
pip install --upgrade pip
pip install neovim
pyenv deactivate


Install (build) YouCompleteMe:

```bash
cd .config/nvim/plugged/youcompleteme
python3 install.py --clangd-completer --rust-completer
```

Links:
  * https://github.com/ycm-core/YouCompleteMe
  * https://github.com/ycm-core/YouCompleteMe#linux-64-bit


7. Tmux config:

```bash
sudo apt install tmux

curl -fsSL https://raw.githubusercontent.com/mligus/dotfiles/main/tmux/.tmux.conf -o $HOME/.tmux.conf
```

8. Install Sublime Text - https://www.sublimetext.com/docs/linux_repositories.html

9. AppImage support

```bash
sudo add-apt-repository ppa:appimagelauncher-team/stable
sudo apt update
sudo apt install appimagelauncher
```

Links:
* https://github.com/TheAssassin/AppImageLauncher/wiki/Install-on-Ubuntu-or-Debian
* https://github.com/TheAssassin/AppImageLauncher/releases/
