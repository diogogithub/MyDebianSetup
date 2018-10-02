#!/bin/sh

set -e

# Install nvim
sudo apt remove vim-tiny vim
sudo apt install neovim fzf silversearcher-ag tmux zathura latexmk

# Make config directory for Neovim's init.vim
echo '[*] Preparing Neovim config directory ...'
mkdir -p ~/.config/nvim

# Make nvim_runtime directory
mkdir -p ~/.nvim_runtime
mkdir -p ~/.nvim_runtime/temp_dirs
mkdir -p ~/.nvim_runtime/temp_dirs/swap
mkdir -p ~/.nvim_runtime/temp_dirs/backup
mkdir -p ~/.nvim_runtime/temp_dirs/undodir
mkdir -p ~/.nvim_runtime/temp_dirs/tags
mkdir -p ~/.nvim_runtime/sessions

# Install nvim (and its dependencies: pip3, git), Python 3 and ctags (for tagbar)
echo '[*] App installing Neovim and its dependencies (Python 3 and git), and dependencies for tagbar (exuberant-ctags) ...'
sudo apt update
sudo apt install -y curl neovim python3 python3-pip git exuberant-ctags global #npm

# Install virtualenv to containerize dependencies
echo '[*] Pip installing virtualenv to containerize Neovim dependencies (instead of installing them onto your system) ...'
python3 -m pip install virtualenv
python3 -m virtualenv -p python3 ~/.config/nvim/env

# Install pip modules for Neovim within the virtual environment created
echo '[*] Activating virtualenv and pip installing Neovim (for Python plugin support), libraries for async autocompletion support (jedi, psutil, setproctitle), and library for pep8-style formatting (yapf) ...'
. "${HOME}/.config/nvim/env/bin/activate"
pip3 install neovim pynvim jedi psutil setproctitle yapf
deactivate

# Install vim-plug plugin manager
echo '[*] Downloading vim-plug, the best minimalistic vim plugin manager ...'
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# (Optional but recommended) Install a nerd font for icons and a beautiful lightline bar (https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts)
echo "[*] Downloading patch font into ~/.local/share/fonts ..."
curl -fLo ~/.local/share/fonts/Iosevka\ Term\ Nerd\ Font\ Complete.ttf --create-dirs https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Iosevka/Regular/complete/Iosevka%20Term%20Nerd%20Font%20Complete.ttf

# Enter Neovim and install plugins using a temporary init.vim, which avoids warnings about missing colorschemes, functions, etc
echo '[*] Running :PlugInstall within nvim ...'
nvim +PlugInstall +qa

echo "[+] Done, welcome to \\033[1m\\033[92mNeoVim\\033[0m! Try it by running: nvim."
