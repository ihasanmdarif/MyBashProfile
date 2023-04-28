#!/bin/bash
# Checking if HomeBrew is installed

$totalSteps ="9"

which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    echo "Homebrew is not install!"
    echo "Installing Homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Homebrew found!"
    echo "Homebrew is updating now..."
    brew update
fi

    echo "Adding Homebrew to the PATH"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/[username]/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"

echo "[1/$totalSteps] Installing iterm2..."
brew install --cask iterm2

echo "[2/$totalSteps] Installing Git..."
brew install git

echo "[3/$totalSteps] Installing Oh My ZSH..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "[4/$totalSteps] Installing PowerLevel10k Theme..."
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

echo "[5/$totalSteps] Installing ZSH-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "[6/$totalSteps] Installing ZSH-autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "[7/$totalSteps] Copy ZSH Config file to user folder..."
cp .zshrc ~/.zshrc

echo "[8/$totalSteps] Reload zshrc config..."
source ~/.zshrc

echo "[9/$totalSteps] Installing iterm theme"
mkdir schemes
curl https://raw.githubusercontent.com/josean-dev/dev-environment-files/main/coolnight.itermcolors --output ./schemes/coolnight.itermcolors 

