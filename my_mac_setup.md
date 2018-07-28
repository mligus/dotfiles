# My macos setup

## Install brew

Go to https://brew.sh/ and get latest install command, e.g.:

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## Install some basic stuff

Git, Python 3 and virtualenvwrapper

```
brew install git
brew install python3
brew install vim
```

### Vim setup

```
curl -o ~/.vimrc https://raw.githubusercontent.com/mligus/dotfiles/master/vim/.vimrc
```

> Allow access to clipboard in *iTerm2*  with `Application in terminal may access clipboard` 
> under `General` settings

### Git setup

```
git config --global user.name "Max Ligus"
git config --global user.email "max.ligus@gmail.com"
```
