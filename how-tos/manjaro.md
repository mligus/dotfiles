# Manjaro Linux as Development Workstation


## Generate secure SSH key


```
ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519 -C "<comment>"
```

> Source: [Upgrade Your SSH Key to Ed25519](https://medium.com/risan/upgrade-your-ssh-key-to-ed25519-c6e8d60d3c54)


## Preparations

1. Set up NTP and Timezone ([source](https://www.linuxsecrets.com/manjaro-wiki/index.php%3Ftitle=System_Time_Setting.html)):

```
timedatectl status

sudo pacman -S ntp
sudo timedatectl set-ntp true

timedatectl status

timedatectl list-timezones
```

2. Update all the system's packages:

```
sudo pacman -Syu
```

3. Configure [AUR (ArchLinux User Repository)](https://wiki.archlinux.org/index.php/Arch_User_Repository):

```
sudo pacman -S --needed base-devel
sudo nvim /etc/makepkg.conf
```

Install helpers:

```
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -sri
```
> `yay` shouldn’t be run with `sudo` privilege.

Great article on AUR - https://linuxhint.com/aur_arch_linux/

4. [Rust](https://www.rust-lang.org/):

```
curl https://sh.rustup.rs -sSf | sh -s -- -y

export PATH="$HOME/.cargo/bin:$PATH"
```

> To get started you need Cargo's bin directory (`$HOME/.cargo/bin`) in your PATH
> environment variable. Next time you log in this will be done
> automatically.
> To configure your current shell run `source $HOME/.cargo/env`

5. Install LLVM:

```
sudo pacman -S llvm clang
```

> There ws an issue with `cargo install bat`


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

## Shell - ZSH + Oh My ZSH!

```
sudo pacman -S zsh
chsh -l
chsh -s /usr/bin/zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
