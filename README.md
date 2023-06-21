# zsh_configs
My custom zsh configs

export ZSH=~/.config/oh-my-zsh

export ZSH_CUSTOM=~/.config/oh-my-zsh/custom

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

pacman -S zsh-theme-powerlevel10k-git ttf-meslo-nerd-font-powerlevel10k

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
MAC: brew install zsh-plugin-highlighting
(check if arch is similar)

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
MAC: brew install zsh-autosuggestions
(check if arch is similar)



done

