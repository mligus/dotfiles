# Arch Linux Install Steps


## Pre-installation


### Verify the boot mode 

If the command shows the directory without error, then the system is booted in UEFI mode:

```bash
ls /sys/firmware/efi/efivars
```

### Connect to the internet

> We will be connect to WiFi network

1. Ensure your network interface is listed and enabled:

```bash
ip link
```

2. Connect to the Wi-Fi network using `iwctl` tool:

```bash
iwctl
```

Execute following commands to connect to ZeroPoint network:

```
[iwd]# device list
[iwd]# station wlan0 connect ZeroPoint
[iwd]# exit
```

> DHCP: dynamic IP address and DNS server assignment (provided by `systemd-networkd` and `systemd-resolved`) should work out of the box 
> for Ethernet, WLAN and WWAN network interfaces.

Check Internet connection:

```baah
ip address
ping -c3 archlinux.org
```

> Note: In the installation image, systemd-networkd, systemd-resolved, iwd and ModemManager are preconfigured and enabled by default. That will not be the case for the installed system.


### Update the system clock

Ensure the system clock is accurate:

```bash
timedatectl set-ntp true
timedatectl status
```


### Partition the disks

Identify disks installed on the system:

```bash
fdisk -l
```

Or:

```bash
lsblk
```

The following partitions are required for a chosen device:

  * One partition for the root directory /
  * For booting in UEFI mode: an EFI system partition.

Use `fdisk` or `parted` to modify partition tables:

```bash
fdisk /dev/nvme0n1
```

Example layout:

  * `/mnt/boot` on `/dev/<efi_system_partition>` - EFI system partition, at least `260 MiB` 
  * **[SWAP]** 	on `/dev/<swap_partition>` - Linux swap, more than `512 MiB`
  * `/mnt` on `/dev/<root_partition>` -	Linux x86-64 root (`/`), remainder of the device

Commands for `fdisk` in my particular case:

  * `p` - print the partition table
  * `g` - create a new empty GPT partition table
  * Boot EFI: `n` -> `1` -> `<Enter>` -> `+512M` -> `t` -> `<Enter` -> `1`
  * Swap: `n` -> `2` -> `<Enter>` -> `+4G` -> `t` -> `<Enter` -> `19`
  * Root partition: `n` -> `3` -> `<Enter>` -> `<Enter>`
  * `p` - double check the newly created partion table
  * `w` - write table to disk and exit


### Format the partitions

Format root partition as `ext4`:

```bash
mkfs.ext4 /dev/nvme0n1p3
```

Initialize swap partition:

```bash
mkswap /dev/nvme0n1p2
```

Format boot partition:

```bash
mkfs.vfat -F32 /dev/nvme0n1p1
```


### Mount the file systems

Mount root partition and assign swap partition:

```bash
mount /dev/nvme0n1p3 /mnt
swapon /dev/nvme0n1p2
```

Create directory for boot partition and mount it:

```bash
mkdir -p /mnt/boot/efi
mount /dev/nvme0n1p1 /mnt/boot/efi
```


### Install essential packages

Use the `pacstrap` script to install the packages, Linux kernel and firmware for common hardware, etc:

```bash
pacstrap /mnt base base-devel \
              linux-hardened linux-firmware \
	      vim \
              dhcpcd iwd \
	      efibootmgr intel-ucode \
              grub sudo
```


### Configure the system

1. Generate an fstab file (use `-U` to define by UUID): 

```bash
genfstab -U /mnt >> /mnt/etc/fstab
```

Check the resulting `/mnt/etc/fstab` file, and edit it in case of errors. 


2. Change root into the new system:

```bash
arch-chroot /mnt
```


3. Set the time zone:

```bash
ln -sf /usr/share/zoneinfo/Canada/Mountain /etc/localtime
```

And run to generate `/etc/adjtime`::

```bash
hwclock --systohc
```

> This command assumes the hardware clock is set to UTC (which is by default our case)


4. Edit `/etc/locale.gen` and uncomment `en_US.UTF-8 UTF-8` and other needed locales. Generate the locales by running: 

```bash
locale-gen
```

Create the `locale.conf` file, and set the `LANG` variable accordingly: 

```bash
vim /etc/locale.conf
```

Content:
```
LANG=en_US.UTF-8
```


5. Create the hostname file:

```bash
echo 'zarch' > /etc/hostname
```

Add matching entries to `/etc/hosts`:

```bash
echo -e '127.0.0.1\tlocalhost' >> /etc/hosts
echo -e '::1\t\tlocalhost' >> /etc/hosts
echo -e '127.0.1.1\tzarch.local\tzarch' >> /etc/hosts
```

And validate:

```bash
cat /etc/hosts
```


6. Set the root password:

```bash
passwd
```

7. Install bootloader:


Install Grub on EFI boot partition:

```bash
grub-install --target=x86_64-efi \
             --bootloader-id=grub_uefi \
	     --recheck
```

Copy compiled locale:

```bash
cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo
```

Create Grub config:

```bash
grub-mkconfig -o /boot/grub/grub.cfg
```


### Reboot

```bash
exit
umount -R /mnt
reboot
```


## Post-installation

[General recommendations](https://wiki.archlinux.org/title/General_recommendations) from Arch Linux Wiki.


### Network Configuration


#### Wireless Configuration

Check that wlan interface is active:

```bash
ip link
```

Enable and start `iwd` service:

```bash
systemctl --now enable iwd
```

Connect to the network using `iwctl` tool:

```bash
iwctl
```

Commands to execute:

```
[iwd]# station wlan0 connect ZeroPoint
[iwd]# station wlan0 show
[iwd]# exit
```

Enable `systemd-resolved` and `systemd-networkd` services:

```bash
systemctl --now enable systemd-networkd
systemctl --now enable systemd-resolved
```

Test connection, reboot and then test again:

```bash
ping -c3 archlinux.org
```

Add config for `systemd-networkd` based on [example configs](https://wiki.archlinux.org/title/Systemd-networkd#Wireless_adapter):

```bash
vim /etc/systemd/network/25-wireless.network
```

Content is following:

```
[Match]
Name=wlan0

[Network]
DHCP=yes

[DHCP]
RouteMetric=20
```

Reboot:

```bash
reboot
```


### Add User

Install ZSH:

```bash
pacman -S zsh
```

Add user and set password:

```bash
useradd -mg users -G wheel,storage,power,audio -s /usr/bin/zsh ml
passwd ml
```

Update `/etc/sudoers` and uncomment line with `%wheel ALL=(ALL) ALL`:

```bash
vim /etc/sudoers
```


### Install Video Driver

Useful info:

  * [Intel graphics](https://wiki.archlinux.org/title/Intel_graphics#Installation)


First, identify the graphics card (the Subsystem output shows the specific model): 

```bash
lspci -v | grep -A1 -e VGA -e 3D
```

Then install an appropriate driver. You can search the package database for a complete list of open-source video drivers: 

```bash
pacman -S xf86-video-intel vulkan-intel mesa \
            intel-media-driver libva-intel-driver libva-utils
```


### Few more Required packages

```bash
pacman -S lm_sensors openssh make mpv youtube-dl neovim fzf
```

Install AUR helper (Yet Another Yogurt). Must be installed under user, not root:

```bash
cd $HOME/Downloads
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```


### Xorg and Window Manager

Useful info:

  * [Xorg on Arch Wiki](https://wiki.archlinux.org/title/Xorg#Installation)
  * [i3 window manager](https://wiki.archlinux.org/title/I3)


Install required packages:

```bash
pacman -S xorg-xinit xorg xorg-server git
```

Additional (required) packages, incl. `i3` window manager, audio tools, terminal:

```bash
# pacman -S unclutter pcmanfm xorg-xmodmap man-pages dmenu \
            alsa-utils \
            rxvt-unicode xsel \
            i3
```

```bash
yay -S urxvt-perls
```

Copy `.xinitrc`, `.Xresources`, `.Xmodmap` and other config from GitHub config repo:

```bash
curl -fsSL https://raw.githubusercontent.com/mligus/dotfiles/main/X11/.xinitrc -o $HOME/.xinitrc
curl -fsSL https://raw.githubusercontent.com/mligus/dotfiles/main/X11/.Xmodmap -o $HOME/.Xmodmap
curl -fsSL https://raw.githubusercontent.com/mligus/dotfiles/main/X11/.Xresources -o $HOME/.Xresources
```

Config for `i3` and tools:

```bash
mkdir -p $HOME/.config/i3
mkdir -p $HOME/.config/i3status
```

```bash
curl -fsSL https://raw.githubusercontent.com/mligus/dotfiles/main/i3/config -o $HOME/.config/i3/config
curl -fsSL https://raw.githubusercontent.com/mligus/dotfiles/main/i3status/config -o $HOME/.config/i3status/config
```


### Extra Fonts (Powerline fonts, etc.)

Install Powerline patched fonts:

```bash
yay -S powerline-fonts-git
```

Check if fonts are installed:

```bash
fc-list | grep 'DejaVu Sans'
```


#### Xorg config and User config

Useful info:

  * [i3 User’s Guide](https://i3wm.org/docs/userguide.html)

Start Xorg:

```bash
startx
```

Start terminal with `$mod+Enter`.


Get device id and name for touchpad:

```bash
xinput list
```

Touchpad config for Xorg:

```bash
vim /etc/X11/xorg.conf.d/30-touchpad.conf
```

Content of `/etc/X11/xorg.conf.d/30-touchpad.conf`:

```
Section "InputClass"
    Identifier "<dev name fron xinit>"
    Driver "libinput"
    MatchIsTouchpad "on"
    Option "Tapping" "on"
    Option "TappingButtonMap" "lmr"
EndSection
```

Restart Xorg now.


Git config:

```bash
git config --global user.name "Max Ligus"
git config --global user.email "max.ligus@gmail.com"
git config --global core.editor /usr/bin/nvim

curl -fsSL https://raw.githubusercontent.com/mligus/dotfiles/master/git/.gitignore_global -o $HOME/.gitignore_global
```

Generate SSH key pair:

```bash
ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519 -C "ml@zarch"
```

Install extra packages:

```bash
sudo pacman -S firefox cmake llvm
```

Install [1Password](https://support.1password.com/install-linux/#arch-linux):

```bash
curl -sS https://downloads.1password.com/linux/keys/1password.asc | gpg --import
cd $HOME/Downloads
git clone https://aur.archlinux.org/1password.git
cd 1password
makepkg -si
```


#### Oh-My-Zsh

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

curl -fsSL https://raw.githubusercontent.com/mligus/dotfiles/main/zsh/.zshrc -o $HOME/.zshrc

curl -fsSL https://raw.githubusercontent.com/mligus/dotfiles/main/other/.profile -o $HOME/.profile

cp $HOME/.profile $HOME/.zprofile
```


### Rust and tools

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

cargo install exa
cargo install bat
cargo install ripgrep
```


### Pyenv and Python 3.x

```bash
curl https://pyenv.run | bash
```

```bash
pyenv install 3.9.7
```

### NeoVim config

```bash
mkdir -p $HOME/.config/nvim/
curl -fsSL https://raw.githubusercontent.com/mligus/dotfiles/main/nvim/init.vim -o $HOME/.config/nvim/init.vim

curl -fsSLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qa
```

Create separate virtual environement for NeoVim:

```bash
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


### Sublime text, Nextcloud, etc.

Install Sublime Text 4:

```bash
curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf

sudo pacman -Syu sublime-text
```

Install NextCloud client:

```bash
sudo pacman -S nextcloud-client
```

Extra config for Firefox:

  * open `about:config`, set `layout.css.devPixelsPerPx` to `1.3` (works good for Framework's laptop screen)


Install Tmux and download config:

```bash
sudo pacman -S tmux

curl -fsSL https://raw.githubusercontent.com/mligus/dotfiles/main/tmux/.tmux.conf -o $HOME/.tmux.conf
```

## Arch Linux with Framework Laptop

Sources: 
  * [Framework Laptop](https://wiki.archlinux.org/title/Framework_Laptop)
  * [Arch Linux on the Framework Laptop](https://community.frame.work/t/arch-linux-on-the-framework-laptop/3843/3)

The inefficient `s2idle` suspend variant is pre-selected as default. You should select the much more efficient `deep` variant:

```bash
cat /sys/power/mem_sleep 
[s2idle] deep
```

Change to `deep`:

```bash
sudo echo deep | sudo tee /sys/power/mem_sleep
cat /sys/power/mem_sleep 
s2idle [deep]
```

To make this permanent, add `mem_sleep_default=deep` to your [kernel parameters](https://wiki.archlinux.org/title/Kernel_parameters).


### Update to Kernel Parameters

Edit `/etc/default/grub` and append your kernel options between the quotes in the `GRUB_CMDLINE_LINUX_DEFAULT` line:

```bash
sudo vim /etc/default/grub
```

Content:

```
GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet mem_sleep_default=deep"
```

And then automatically re-generate the `grub.cfg` file with:

```bash
sudo grub-mkconfig -o /boot/grub/grub.cfg
```
