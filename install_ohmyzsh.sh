#!/bin/bash
set -x
export ZSH=~/.config/oh-my-zsh
export ZSH_CUSTOM=${ZSH}/custom
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
yay --noconfirm -S zsh ttf-meslo-nerd-font-powerlevel10k zsh-theme-powerlevel10k-git zsh-syntax-highlighting