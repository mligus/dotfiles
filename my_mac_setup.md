# My macOS setup

* [iTerm2](https://iterm2.com/)
* [Docker](https://www.docker.com/get-docker)
* [NeoVim](https://neovim.io/) */experimental/*
* [JDK version 1.8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) */for Scala/*
* [JRNL](http://jrnl.sh/index.html)
* [The Silver Searcher](https://github.com/ggreer/the_silver_searcher)


### Setup iTerm2

<TBD>


## Install brew and packages

Go to https://brew.sh/ and get latest install command, e.g.:

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Install Git, Python, Pyenv, FuzzyFinder, Jrnl, etc. 

```
brew update
brew install git
brew install python3
brew install vim
brew install fzf
brew install pyenv
brew install pyenv-virtualenv
brew install jrnl
brew install the_silver_searcher
```


### Vim setup

```
curl -o ~/.vimrc https://raw.githubusercontent.com/mligus/dotfiles/master/vim/.vimrc
```

> Allow access to clipboard in *iTerm2*  with `Application in terminal may access clipboard` 
> under `General` settings


### FZF setup

To install useful keybindings and fuzzy completion:

```
/usr/local/opt/fzf/install
```

To use fzf in Vim, add the following line to your .vimrc:

```
set rtp+=/usr/local/opt/fzf
```


### Git setup

```
git config --global user.name "Max Ligus"
git config --global user.email "max.ligus@gmail.com"
```


## Pyenv setup

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


## Install Scala & SBT

```
brew update
brew install scala
brew install sbt
```

Caveats for `scala` and `sbt`:

```
To use with IntelliJ, set the Scala home to:
  /usr/local/opt/scala/idea

Bash completion has been installed to:
  /usr/local/etc/bash_completion.d
```

> You can use `$SBT_OPTS` to pass additional JVM options to SBT.
> Project specific options should be placed in .sbtopts in the root of your project.
> Global settings should be placed in /usr/local/etc/sbtopts
