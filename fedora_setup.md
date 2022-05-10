# Fedora 36 on Framework laptop


## Generate a good SSH key

```bash
ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519 -C "<login>@<hostname>"
```

## Post-install Configuration

Remap Caps Lock to Control key:

```bash
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:ctrl_modifier']"
```


Enable some power saving features via [Framework laptop guide for Fedora 36](https://guides.frame.work/Guide/Fedora+36+Installation+on+the+Framework+Laptop/108)
and [Linux battery life tuning](https://community.frame.work/t/linux-battery-life-tuning/6665):

```bash
sudo grubby --update-kernel=ALL --args="nvme.noacpi=1"
sudo grubby --update-kernel=ALL --args=mem_sleep_default=deep
reboot
```

Install [NeoVim](https://github.com/neovim/neovim/wiki/Installing-Neovim#fedora):

```bash
sudo dnf install -y neovim python3-neovim
```

Copy NeoVim config and Plug manager:

```bash
mkdir -p $HOME/.config/nvim/
curl -fsSL https://raw.githubusercontent.com/mligus/dotfiles/master/nvim/init.vim -o $HOME/.config/nvim/init.vim

curl -fsSLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Install plugins:

```bash
vim +PlugInstall +qa
```

Install Python dependacies:

```bash
pyenv virtualenv 3.10.4 nvim3
pyenv activate nvim3
pip install --upgrade pip
pip install neovim
pyenv deactivate
```

Install (build) YouCompleteMe:

```bash
sudo dnf install -y python3-devel
pushd ~/.config/nvim/plugged/youcompleteme
python3 install.py --clangd-completer --rust-completer
popd
```
Add some aliases (for Bash - `.bashrc` and Zsh - `.zshrc`):

```
# Aliases
alias vi='nvim'
alias vim='nvim'
```

Global Git config:

```bash
git config --global user.name "Max Ligus"
git config --global user.email "max.ligus@gmail.com"
git config --global core.editor $(which nvim)
``` 

Download `.gitignore` from GitHub repo:

```bash
curl -fsSL https://raw.githubusercontent.com/mligus/dotfiles/master/git/.gitignore_global -o $HOME/.gitignore_global
```

Install [Meslo Dotted Regular font] for user:

```bash
curl -fsSL https://github.com/powerline/fonts/blob/master/Meslo%20Dotted/Meslo%20LG%20L%20DZ%20Regular%20for%20Powerline.ttf?raw=true -o ~/Downloads/meslo_powerline.ttf
mkdir -p ~/.local/share/fonts/meslo_powerline/
cp ~/Downloads/meslo_powerline.ttf ~/.local/share/fonts/meslo_powerline/
fc-cache -v
```


### Power Saving 

Install [TLP](https://linrunner.de/tlp/installation/fedora.html):

```bash
sudo dnf install tlp tlp-rdw
sudo systemctl enable tlp.service
sudo systemctl mask systemd-rfkill.service systemd-rfkill.socket
```

Edit `/etc/tlp.conf` and add:

```
PCIE_ASPM_ON_BAT=powersupersave
```

Install Powertop (no config since it clashes with TLP on Framework laptop):

```bash
sudo dnf install powertop
```

Allow other than 100% and 200% scaling for Gnome:

```bash
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
reboot
```

Install [1password](https://support.1password.com/install-linux/#centos-fedora-or-red-hat-enterprise-linux):

```bash
sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
sudo sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=\"https://downloads.1password.com/linux/keys/1password.asc\"" > /etc/yum.repos.d/1password.repo'
sudo dnf install 1password
```

Install [Sublime Text](https://www.sublimetext.com/docs/linux_repositories.html#dnf):

```bash
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
sudo dnf install sublime-text
```


### Enable Hibernation

Source: https://www.jameskupke.com/posts/using-framework-with-fedora/#enabling-hibernation
Source: https://www.ctrl.blog/entry/fedora-hibernate.html

Fedora is a bit unique where by default it creates a ZRAM file as the swap. 
This is fine for normal OS use, but creates an issue with hibernation 
as the operating system needs to mount the file to create the swap space.
The last step was to mount the swap space upon boot up:

1. Use `blkid` to find the UUID of the newly created swap partition
2. Edit fstab at `/etc/fstab`
3. Add the swap mount: `UUID=<<Your UUID for swap>> none swap defaults 0 0`


Add/edit `sudo nvim /etc/dracut.conf.d/resume.conf` and add:

```
add_dracutmodules+=" resume "
```

Generate your new `initramfs`: 

```bash
sudo dracut -f
```

Get your swap partition UUID:

```bash
sudo blkid | grep swap
```

Append following to `/etc/default/grub`:

```
GRUB_CMDLINE_LINUX="[…] resume=UUID=your-swap-identifier"
```

Make grub config:

```bash
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
```

Open the file `/etc/systemd/sleep.conf` and make sure it includes the following options:

```
[Sleep]
AllowHibernation=yes
HibernateMode=shutdown
```

Test hibernation:

```
systemctl hibernate
```

Enable Suspend then Hibernate:

1. Edit `/etc/systemd/logind.conf`:

```
HandleLidSwitch=suspend-then-hibernate
```

2. Edit `/etc/systemd/sleep.conf`:

```
AllowSuspendThenHibernate=yes
HibernateDelaySec=45min
```


Enable audio power saving (from [Arch wiki](https://wiki.archlinux.org/title/Power_management#Audio)) 
by creating `/etc/modprobe.d/audio_powersave.conf` (for Intel sound cards):

```
options snd_hda_intel power_save=1
```

Wifi card power saving - create `/etc/modprobe.d/iwlwifi.conf`:

```
options iwlwifi power_save=1
options iwlmvm power_scheme=3
```

And reboot:

```bash
reboot
```


### Install Zsh and oh-my-zsh


Install ZSH and set it as default for user:

```bash
sudo dnf install -y util-linux-user zsh
chsh -s $(which zsh)
reboot
```

> Copy any aliases from `.bashrc` to `.zshrc`.


Install [Oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh#basic-installation):

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Install [Spaceship Prompt](https://github.com/spaceship-prompt/spaceship-prompt):

```bash
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```

Set `ZSH_THEME="spaceship"` in your `.zshrc`


### Install Developer Tools

Install [Rust](https://www.rust-lang.org/tools/install):

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
```

Install some apps for CLI and shell:

```bash
cargo install exa
cargo install bat
cargo install ripgrep
```

Install Python 3 build dependencies:

```bash
sudo dnf builddep python3
```

Install [Pyenv](https://github.com/pyenv/pyenv):

```bash
curl https://pyenv.run | bash
curl -fsSL https://raw.githubusercontent.com/mligus/dotfiles/main/other/.profile -o $HOME/.profile
cp $HOME/.profile $HOME/.zprofile
reboot
```

Install latest Python 3 version:

```bash
pyenv install 3.10.4
```