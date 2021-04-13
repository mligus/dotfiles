# ArchLinux - Install and Configuration


## Post-install steps

### Tune performance

Reduce *swappiness*:

```
# sysctl -w vm.swappiness=10
```

The default value of vm.swappiness is 60 and represents the percentage of the free memory before activating swap. The lower the value, the less swapping is used and the more memory pages are kept in physical memory.


### Rust lang

```
curl https://sh.rustup.rs -sSf | sh -s -- -y
```


### Powerline fonts

```
$ git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
```


### FZF (fuzzy-find)

```
$ sudo pacman -S fzf
```

### Pyenv and other Python tools

Source: https://github.com/pyenv/pyenv-installer

```
$ curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
```

### NeoVim

Install NeoVim:
```
# pacman -S neovim python-neovim xclip xsel
```

Prepare Python virtual env:
```
$ pyenv install 3.9.2
$ pyenv virtualenv 3.9.2 neovim

$ pyenv activate neovim
$ pip install --upgrade pip
$ pip install pynvim
$ pyenv deactivate
```

Copy config from GitHub:
```
$ curl -fsSL https://raw.githubusercontent.com/mligus/dotfiles/main/nvim/init.vim -o $HOME/.config/nvim/init.vim
```


### Git

```
$ sudo pacman -S git
```

```
$ git config --global user.name "Max Ligus"
$ git config --global user.email "max.ligus@gmail.com"
$ git config --global core.editor /usr/bin/nvim
$ curl -fsSL https://raw.githubusercontent.com/mligus/dotfiles/master/git/.gitignore_global -o $HOME/.gitignore_global
```


### Zsh

```
$ sudo pacman -S zsh
$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Install Spaceship Prompt:
```
$ ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
$ git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
$ ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```

Download personal pre-populated ZSH config:
````
$ curl -fsSL https://raw.githubusercontent.com/mligus/dotfiles/master/zsh/.zshrc -o $HOME/.zshrc
```
