# Dotfiles aka Work Environment Setups


## Ubuntu

Bootstrap clean Ubuntu Server as a development station:

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/mligus/dotfiles/master/bootstrap.sh)"
```

Tested on:

  * Ubuntu Server 18.04.3


### Know peculiarities and issues

1. After installation of `oh-my-zsh` you will be dropped to `zsh` shell. Type `exit` and hit enter to continue setup.
2. From time to time you will be asked for your password, since script use `sudo` internally.
3. On Neovim set up setup have to click *Enter* once since it complains about missing theme.


## macOS


### Install Homebrew and packages

Go to [Homebrew](https://brew.sh/) website and get latest install command, e.g.:

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Install few packages right away:

```
brew update
brew install git
brew install python3
brew install fzf
brew install the_silver_searcher
brew install tmux
```

To install useful `fzf` keybindings and fuzzy completion use:

```
/usr/local/opt/fzf/install
```

### Git setup

```
git config --global user.name "Max Ligus"
git config --global user.email "max.ligus@gmail.com"
```


### Install and configure Pyenv

```
brew install pyenv
brew install pyenv-virtualenv
```

```
pyenv install 2.7.12
pyenv install 3.7.0
```


## NeoVim setup

> NeoVim with Python support [how-to](https://github.com/tweekmonster/nvim-python-doctor/wiki/Advanced:-Using-pyenv)

Install NeoVim

```
pyenv virtualenv 3.7.0 neovim3
pyenv activate neovim3
pip install neovim
pyenv which python

pip install flake8
ln -s `pyenv which flake8` ~/bin/flake8  # Assumes that $HOME/bin is in $PATH

pyenv virtualenv 2.7.12 neovim2
pyenv activate neovim2
pip install neovim
pyenv which python
```

Create a NeoVim config file (and directory):

```
mkdir -p ~/.config/nvim/autoload
touch ~/.config/nvim/init.vim
```

Install `vim-plug`:

```
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
