#! /bin/sh
NAME=""
EMAIL=""

# Install programs
echo 'Installing programs...'
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install cmake build-essential exuberant-ctags silversearcher-ag git -y
echo 'Programs installed.'

# Configure them
echo 'Configuring git...'
git config --global --replace-all user.name $NAME
git config --global --replace-all user.email $EMAIL
git config  --global push.default simple
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'
echo 'Completed git.'

mkdir $HOME/dev
cd $HOME/dev

git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git
gnome-terminal-colors-solarized/install.sh

git clone https://github.com/seebi/dircolors-solarized.git
