#!/bin/bash
sudo apt-get update

echo 'Set dock to BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM

echo 'installing vim'
sudo apt install vim -y
clear

echo 'installing curl' 
sudo apt install curl -y

echo 'installing tool to handle clipboard via CLI'
sudo apt-get install xclip -y

echo  'installing videocodecs'
sudo apt install libavcodec-extra -y

echo 'installing git' 
sudo apt install git -y

echo 'installing terminator'
sudo apt-get update
sudo apt-get install terminator -y

echo 'installing Android Studio'
sudo snap install android-studio --classic

echo "Can i install IntelliJ Ultimate? (y/n)"
read -r intellij_version
if echo "$intellij_version" | grep -iq "^y" ;then
	echo 'installing IDEA Community'
	sudo snap install intellij-idea-ultimate --classic --edge
else
	echo 'installing IDEA Community'
	sudo snap install intellij-idea-community --classic
fi

echo 'installing code'
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https -y
sudo apt-get update
sudo apt-get install code -y # or code-insiders

echo 'installing Dbeaver'
sudo snap install dbeaver-ce
sudo apt install -f -y

echo 'installing docker' 
sudo apt-get remove docker docker-engine docker.io
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
docker --version

chmod 777 /var/run/docker.sock
docker run hello-world

echo 'installing Spotify' 
sudo snap install spotify

echo 'installing Discord' 
sudo snap install discord

echo 'installing VLC'
sudo snap install vlc

echo 'installing chrome' 
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo 'installing sdkman'
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version

echo "What name do you want to use in GIT user.name?"
echo "For example, mine will be \"Rafael Lucini\""
read -r git_config_user_name
git config --global user.name "$git_config_user_name"
clear 

echo "What email do you want to use in GIT user.email?"
echo "For example, mine will be \"rafaellucini@gmail.com\""
read -r git_config_user_email
git config --global user.email "$git_config_user_email"
clear

echo "Can I set VIM as your default GIT editor for you? (y/n)"
read -r git_core_editor_to_vim
if echo "$git_core_editor_to_vim" | grep -iq "^y" ;then
	git config --global core.editor vim
else
	echo "Okay, no problem. :) Let's move on!"
fi

echo "Generating a SSH Key"
ssh-keygen -t rsa -b 4096 -C "$git_config_user_email"
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub | xclip -selection clipboard

echo 'enabling workspaces for both screens' 
gsettings set org.gnome.mutter workspaces-only-on-primary false

echo 'installing zsh'
sudo apt-get install zsh -y
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s /bin/zsh

export alias pbcopy='xclip -selection clipboard'
export alias pbpaste='xclip -selection clipboard -o'
source ~/.zshrc

echo 'installing nvm' 
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

source ~/.zshrc
nvm --version
nvm install 12.4.0
nvm alias default 12.4.0
node --version
npm --version

echo 'installing AngularCLI'
npm install -g @angular/cli

echo 'installing npm-check'
npm install -g npm-check

echo 'installing autosuggestions' 
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
source ~/.zshrc

echo 'installing theme'
sudo apt install fonts-firacode -y
wget -O ~/.oh-my-zsh/themes/node.zsh-theme https://raw.githubusercontent.com/skuridin/oh-my-zsh-node-theme/master/node.zsh-theme 
sed -i 's/.*ZSH_THEME=.*/ZSH_THEME="node"/g' ~/.zshrc

echo 'installing Open JDK 11'
sdk install java 11.0.7-open

echo 'installing NoMachine'
wget -c https://download.nomachine.com/download/6.10/Linux/nomachine_6.10.12_1_amd64.deb
sudo dpkg -i nomachine_6.10.12_1_amd64.deb
