# Installation script for macOS dotfiles
# This script automates the setup of a new development environment on macOS
# Includes installation of:
# - Homebrew and common packages
# - Oh My Zsh with Powerlevel10k
# - NVM (Node Version Manager)
# - Custom configurations (dotfiles)
#
# Author: Oscar Barajas @gndx

#!/bin/bash

echo "░▒▓██████████████▓▒░ ░▒▓██████▓▒░ ░▒▓██████▓▒░▒▓████████▓▒░▒▓███████▓▒░ ░▒▓██████▓▒░░▒▓███████▓▒░"
echo "░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░"
echo "░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░        ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░"
echo "░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░▒▓█▓▒░        ░▒▓█▓▒░   ░▒▓███████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░"
echo "░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░        ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░"
echo "░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░"
echo "░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓██████▓▒░  ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░"
echo "\n Welcome to the dotfiles installation script.  \n Preparing the environment...  \n"

keep_sudo_alive() {
    while true; do sudo -n true; sleep 60; done 2>/dev/null &
}

check_command() {
    local cmd="$1"
    command -v "$cmd" &> /dev/null
}

config() {
    echo "Removing existing files...  \n"
    rm -rf ~/.zshrc ~/.zprofile ~/.p10k.zsh ~/.gitconfig	2>/dev/null

    echo "Creating directories...  \n"
    mkdir -p ~/develop

    echo "Creating symbolic links...  \n"
    ln -s ~/dotfiles/.zshrc ~/.zshrc
    ln -s ~/dotfiles/.zprofile ~/.zprofile
    ln -s ~/dotfiles/.p10k.zsh ~/.p10k.zsh
    ln -s ~/dotfiles/.gitconfig ~/.gitconfig

    echo "Installing GitMoji...  \n"
    npm install -g gitmoji-cli
}

install_brew() {
  echo "Installing Brew...  \n"
	if ! check_command brew; then
		NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	fi
}

install_oh_my_zsh() {
  echo "Installing Oh My Zsh..."
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
        echo "Oh My Zsh installed successfully."
    else
        echo "Oh My Zsh is already installed."
    fi
}

install_powerlevel10k() {
  echo "Installing Powerlevel10k...  \n"
    if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
        echo "Installing Powerlevel10k theme"
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
    else
        echo "Powerlevel10k is already installed."
    fi
}

install_nvm() {
  echo "Installing NVM (Node Version Manager)...  \n"
    if ! check_command nvm; then
        echo "Installing NVM (Node Version Manager)..."
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    else
        echo "NVM is already installed."
    fi
}

install_brew_packages() {
  echo "Installing Brew packages...  \n"
    brew update
    brew install gh
    for package in google-chrome appcleaner postman visual-studio-code cursor spotify obs audacity ollama; do
        if ! brew list --cask $package &>/dev/null; then
            brew install --cask $package
        else
            echo "$package is already installed."
        fi
    done
}

mactron() {
  echo "Configuring Mac \n"
  install_brew
  install_brew_packages
  install_oh_my_zsh
  install_powerlevel10k
  install_nvm
  config
}

mactron

echo "Dotfile installation complete!"