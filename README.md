Dotfiles
========

This is my collection of [configuration files](http://dotfiles.github.io/).

Usage
-----

Pull the repository, and then create the symbolic links [using GNU
stow](https://alexpearce.me/2016/02/managing-dotfiles-with-stow/).

```bash
$ git clone https://github.com/diogogithub/.dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ stow tools templates composer feh geany ghc git i3 mariadbcli pgsqlcli ranger terminfo theme xorg-server zathura  # plus whatever else you'd like
```
Applications
------------

**OS**: Debian
**Desktop Environment**: XFCE
**WM**: i3
**LockScreen**: light-lock
**Launcher**: Rofi
**Browser**: Firefox
**Development Environment**: Neovim
**Document Viewer**: Atril
**File Manager**: PCManFM
**Music**: pragha
**Video**: totem


License
-------

[MIT](http://opensource.org/licenses/MIT).

## Installing

### Download

Download the XFCE CD1 from: https://cdimage.debian.org/debian-cd/current/amd64/iso-cd

### Repositories Keys

    wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
    wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
    wget -O- https://jgeboski.github.io/obs.key | sudo apt-key add -
    wget -O- http://apt.metasploit.com/metasploit-framework.gpg.key | sudo apt-key add -
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 60EE47FBAD3DD469
    wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add -


### USB flash installation media

    dd if=debian-9.2.1-amd64-xfce-CD-1.iso of=/dev/sdb bs=4M

### Software selection

Select:

* print server
* standard system utilities
* XFCE

## Setting the repositories

    apt install aptitude
    aptitude install debian-archive-keyring
    aptitude install synaptic apt-xapian-index gdebi

## SUDO

### Install sudo
    aptitude install sudo gksu

### Add Administrator to sudoers
    adduser {username} sudo

## Hardware

### Firmware
    aptitude install firmware-linux intel-microcode amd64-microcode initramfs-tools firmware-amd-graphics
    aptitude install inotify-tools inotify-hookable sassc
    dpkg --add-architecture i386

### Wifi

    aptitude install firmware-realtek firmware-iwlwifi

### Battery and Overheating

* tlp
* tlp-rdw
* thermald
* cpufreqd

`sudo aptitude install tlp tlp-rdw thermald cpufreqd`

> For thinkpads only: `sudo aptitude install tp-smapi-dkms acpi-call-dkms`

### Hardware sensors

* lm-sensors
* hddtemp
* psensor
* i7z
* cpupower

`sudo aptitude install lm-sensors hddtemp psensor`

### Disable bluetooth auto power-on

Blueman automatically enables Bluetooth adapter when certain events (on boot, laptop lid is opened, ...) occur. This can be disabled with the auto-power-on in org.blueman.plugins.powermanager:

    sudo gsettings set org.blueman.plugins.powermanager auto-power-on false

### Network

Proper network manager with VPN support

* curl
* network-manager
* network-manager-gnome
* network-manager-openvpn
* network-manager-vpnc
* network-manager-vpnc-gnome
* network-manager-pptp
* network-manager-pptp-gnome
* network-manager-openvpn
* network-manager-openvpn-gnome
* pptpd
* ppp
* pptp-linux

`sudo aptitude install curl network-manager network-manager-gnome network-manager-openvpn network-manager-vpnc network-manager-vpnc-gnome network-manager-pptp network-manager-pptp-gnome network-manager-openvpn network-manager-openvpn-gnome pptpd ppp pptp-linux`

### Storage

* gnome-disks
* gparted

`sudo aptitude install gnome-disks gparted`

## Shell

* `sudo aptitude install kitty ripgrep zsh shellcheck`
* `stow kitty shell tmux`

* `chsh -s $(which zsh)`
* `sudo update-alternatives --config x-terminal-emulator`

## Appearance

### Utilities

* lxappearance
* xsettingsd
* nitrogen

### Theme

* numix-gtk-theme
* numix-icon-theme


`sudo aptitude install numix-gtk-theme numix-icon-theme`

### Fonts

* ttf-mscorefonts-installer
* ttf-dejavu
* fonts-hack-ttf
* fonts-font-awesome
* fonts-open-sans
* fonts-paratype

`sudo aptitude install ttf-mscorefonts-installer ttf-dejavu fonts-hack-ttf fonts-font-awesome fonts-open-sans fonts-paratype`

#### Install Microsoft Tahoma, Segoe UI, and other fonts

    mkdir ~/.fonts
    wget -qO- http://plasmasturm.org/code/vistafonts-installer/vistafonts-installer | bash

### Spotlight (unused)

[Diogo's spotlight script](https://git.gnu.io/snippets/107)

### i3

* [i3](https://blog.diogo.site/posts/i3wm)
* suckless-tools
* i3blocks
* [XBright](https://github.com/snobb/xbright)
* [morc_menu](https://github.com/Boruch-Baum/morc_menu)
* ranger
* light-locker
* dconf-editor
* xdotool

* `sudo aptitude install i3 j4-dmenu-desktop suckless-tools i3blocks ranger nitrogen light-locker xdotool`

#### Notifications

* xfce4-notifyd

`sudo aptitude install xfce4-notifyd`

## System

### Power Manager

* xfce4-power-manager

`sudo aptitude install xfce4-power-manager`

### SECURITY (FIREWALL AND ANTI-VIRUS)

    sudo aptitude install ufw gufw clamav clamtk
    sudo ufw default deny
    sudo ufw enable

### Updates notifier

* pk-update-icon
* apt-config-auto-update

`sudo aptitude install pk-update-icon apt-config-auto-update`

### Wine

`sudo aptitude -t stretch-backports install wine`

## General Software

### Multimedia

* pavucontrol
* libavcodec-extra
* clementine
* gimp
* totem
* handbrake
* kdenlive
* audacity
* krita
* blender
* freecad
* openscad

`sudo aptitude install pavucontrol libavcodec-extra clementine gimp totem handbrake kdenlive audacity cmus`

### Utilities

* tmux
* parcellite
* qalculate
* gparted
* simplescreenrecorder
* kde-spectacle
* gthumb
* feh
* engrampa
* arandr
* redshift-gtk
* seahorse

`sudo aptitude install tmux parcellite qalculate gparted libreoffice simplescreenrecorder kde-spectacle gthumb engrampa arandr redshift-gtk seahorse`

### Programming

* geany with [Darcula colorscheme](https://raw.githubusercontent.com/codebrainz/geany-themes/master/colorschemes/darcula.conf)
* git

`sudo aptitude install geany git`

#### Neovim

* `sudo aptitude purge vim-tiny`
* `sudo aptitude install neovim`
* `stow neovim tags-settings python javascript ruby`
* `~/.config/nvim/installer/install.sh`

### Internet

* `sudo aptitude install deluge firefox`

#### Chatting

* [hexchat](https://hexchat.readthedocs.io/en/latest/building.html#unix) (with [Monokai](https://hexchat.github.io/themes.html) theme)
* `sudo aptitude install pidgin`

#### KDE CONNECT

    sudo aptitude install kdeconnect
    sudo ufw allow 1714:1764/udp
    sudo ufw allow 1714:1764/tcp
    sudo ufw reload

### Math

* bc
* SageMath
* GNUPlot
* jupyter-notebook

`sudo aptitude install bc sagemath gnuplot python3-dev python3-pip jupyter-notebook`

### Office

* atril
* libreoffice

`sudo aptitude install atril libreoffice zathura`
