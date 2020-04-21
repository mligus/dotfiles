# Manjaro Linux as Development Workstation


## Preparations

Generate a [secure Ed25519 SSH key](https://medium.com/risan/upgrade-your-ssh-key-to-ed25519-c6e8d60d3c54) SSH key:

```
ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519 -C "<comment>"
```

Update all the system and packages to latest version:

```
sudo pacman -Syu
```

[HiDPI support](https://wiki.archlinux.org/index.php/HiDPI) for Xfce (*and others*):

```
xfconf-query -c xsettings -p /Gdk/WindowScalingFactor -s 2
xfconf-query -c xfwm4 -p /general/theme -s Default-xhdpi
reboot
```

Set up NTP and Timezone ([source](https://www.linuxsecrets.com/manjaro-wiki/index.php%3Ftitle=System_Time_Setting.html)):

```
timedatectl status

sudo pacman -S ntp
sudo timedatectl set-ntp true

timedatectl status
```
> You can list available timezones with `timedatectl list-timezones`

Reduce swappiness ([source](https://averagelinuxuser.com/10-things-to-do-after-installing-manjaro/)):

```
sudo nano /etc/sysctl.d/100-manjaro.conf
```

Add following content to that file:

```
vm.swappiness=10
```

Reboot and check:

```
reboot
cat /proc/sys/vm/swappiness
```

Configure [AUR (ArchLinux User Repository)](https://wiki.archlinux.org/index.php/Arch_User_Repository):

```
sudo pacman -S --needed base-devel 
```

Update `MAKEFLAGS` and `CFLAGS` in `/etc/makepkg.conf` if needed (not in my case, default is good).

Install AUR helpers, such as YAY:

```
cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -sri
```
> `yay` shouldn’t be run with `sudo` privilege.

> Great article on AUR - https://linuxhint.com/aur_arch_linux/

Install LLVM and Clang:

```
sudo pacman -S llvm clang
```

Install [Rust](https://www.rust-lang.org/):

```
curl https://sh.rustup.rs -sSf | sh -s -- -y

export PATH="$HOME/.cargo/bin:$PATH"
```

> To get started you need Cargo's bin directory (`$HOME/.cargo/bin`) in your PATH
> environment variable. Next time you log in this will be done
> automatically.
> To configure your current shell run `source $HOME/.cargo/env`


[Powerline fonts](https://github.com/powerline/fonts):

```
cd /tmp
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
````

## Install tools

1. [FZF](https://github.com/junegunn/fzf)

```
sudo pacman -S fzf
```

2. Tmux

```
sudo pacman -S tmux
curl -fsSL https://raw.githubusercontent.com/mligus/dotfiles/master/tmux/.tmux.conf -o $HOME/.tmux.conf
```

3. [NeoVim](https://github.com/neovim/neovim)

```
sudo pacman -S neovim python-pynvim
yay -S neovim-symlinks neovim-drop-in
```

Configure Neovim:

```
NVIM_CONFIG=$HOME/.config/nvim/
mkdir -p $NVIM_CONFIG
curl -fsSL https://raw.githubusercontent.com/mligus/dotfiles/master/nvim/init.vim -o $NVIM_CONFIG/init.vim
curl -fsSLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

```
pyenv install 3.8.2
pyenv install 2.7.17

pyenv virtualenv 3.8.2 neovim3
pyenv virtualenv 2.7.17 neovim2

pyenv activate neovim3
pip install --upgrade pip
pip install pynvim
pyenv deactivate

pyenv activate neovim2
pip install --upgrade pip
pip install pynvim
pyenv deactivate
```

Resources:
  
  * https://wiki.archlinux.org/index.php/Neovim
  
4. Git

```
git config --global user.name "Max Ligus"
git config --global user.email "max.ligus@gmail.com"
git config --global core.editor /usr/bin/nvim
curl -fsSL https://raw.githubusercontent.com/mligus/dotfiles/master/git/.gitignore_global -o $HOME/.gitignore_global
```

5. Other tools:

```
# https://the.exa.website/install
cargo install exa
# https://github.com/sharkdp/bat#installation
cargo install bat
# https://github.com/BurntSushi/ripgrep#installation
cargo install ripgrep
```

## Shell - ZSH + Oh My ZSH! + Spaceship Prompt

```
sudo pacman -S zsh
chsh -l
chsh -s /usr/bin/zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

**NOTE:** Log out and log back in after installing to see ZSH applied as default shell

Install [Spaceship Prompt](https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/Troubleshooting.md):

```
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```

Download personal pre-populated ZSH config:

```
curl -fsSL https://raw.githubusercontent.com/mligus/dotfiles/master/zsh/.zshrc -o $HOME/.zshrc
```

## Python

Install [pyenv](https://github.com/pyenv/pyenv):

```
curl -fsSL https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
```

