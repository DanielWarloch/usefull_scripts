#!/bin/bash

sudo apt install curl python3 python3-pip python3-venv zsh git ranger tree fonts-firacode -y

# Install Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Fonts for Oh My ZSH Powerlevel10k
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

# Download Powerlevel10k
git clone --depth=1 https://github.coym/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Download zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Download zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Download git-extra-commands
git clone https://github.com/unixorn/git-extra-commands.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/git-extra-commands



echo 'if ! $(echo $PATH |grep -q ~/.local/bin1); then export PATH=~/.local/bin:$PATH; fi' >> ~/.zshrc


# Add Powerlevel10k to .zshrc
sed -i -E 's/^ZSH_THEME=".*"+$/ZSH_THEME="powerlevel10k\/powerlevel10k"\n/g' ~/.zshrc 
sed -i 's/^plugins=(git)$/plugins=(git\n\tsudo\n\tgit-extra-commands\n\tzsh-autosuggestions\n\tzsh-syntax-highlighting # Must be at the end\n)/g' ~/.zshrc
