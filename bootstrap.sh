#!/bin/sh

# Settings
PYTHON_2_VERSION=2.7.16
PYTHON_3_VERSION=3.7.4


echo "Running as $USER"
echo "Home directory: $HOME"
echo

echo ">>> Install system upgrades <<<"
sudo apt update
sudo apt upgrade -y
echo ">>> DONE <<<\n"

echo ">>> Install required packaeg <<<"
sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
        libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
        xz-utils tk-dev libffi-dev liblzma-dev libclang-dev python-openssl git
# https://github.com/junegunn/fzf#debian
sudo apt install fzf
echo ">>> DONE <<<\n"

echo ">>> Tmux config <<<"
sudo apt install -y tmux
curl -fsSL https://raw.githubusercontent.com/mligus/dotfiles/master/tmux/.tmux.conf -o $HOME/.tmux.conf
echo ">>> DONE <<<\n"

echo ">>> Set up NeoVim <<<"
# sudo apt install -y python-dev python-pip python3-dev python3-pip
sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo apt update
sudo apt install -y neovim
sudo apt install -y python3-neovim
sudo apt install -y python-neovim
# Set as editor alternatives
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --skip-auto --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --skip-auto --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --skip-auto --config editor
echo ">>> DONE <<<\n"

echo ">>> Configure Git <<<"
sudo apt install -y git
git config --global user.name "Max Ligus"
git config --global user.email "max.ligus@gmail.com"
git config --global core.editor /usr/bin/nvim
curl -fsSL https://raw.githubusercontent.com/mligus/dotfiles/master/git/.gitignore_global -o $HOME/.gitignore_global
echo ">>> DONE <<<\n"

echo ">>> Install Rust (and tools) <<<"
curl https://sh.rustup.rs -sSf | sh -s -- -y
export PATH="$HOME/.cargo/bin:$PATH"
# Install some usefull CLI tools
# https://the.exa.website/install
cargo install exa
# https://github.com/sharkdp/bat#installation
cargo install bat
# https://github.com/BurntSushi/ripgrep#installation
cargo install ripgrep
echo ">>> DONE <<<\n"

echo ">>> Installand set up Python enviroment <<<"
# Pyenv
curl -fsSL https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
echo ">>> DONE <<<\n"

echo ">>> Configure NeoVim and install plugins <<<"
NVIM_CONFIG=$HOME/.config/nvim/
PYENV_BIN=$HOME/.pyenv/bin/pyenv
PYENV_VERSIONS=$HOME/.pyenv/versions
mkdir -p $NVIM_CONFIG
curl -fsSL https://raw.githubusercontent.com/mligus/dotfiles/master/nvim/init.vim -o $NVIM_CONFIG/init.vim
curl -fsSLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
$PYENV_BIN install $PYTHON_2_VERSION
$PYENV_BIN install $PYTHON_3_VERSION
$PYENV_BIN virtualenv -f $PYTHON_2_VERSION neovim2
$PYENV_BIN virtualenv -f $PYTHON_3_VERSION neovim3
$PYENV_VERSIONS/neovim2/bin/pip install neovim
$PYENV_VERSIONS/neovim3/bin/pip install neovim
vim +PlugInstall +qa
echo ">>> DONE <<<\n"

echo ">>> Cleanup <<<"
sudo apt autoremove
echo ">>> DONE <<<\n"

echo ">>> Set up Zsh and Oh-My-Zsh <<<"
sudo apt install -y zsh powerline fonts-powerline
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Spaceship Prompt
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
# Download ZSH config
curl -fsSL https://raw.githubusercontent.com/mligus/dotfiles/master/zsh/.zshrc -o $HOME/.zshrc
echo ">>> DONE <<<\n"
