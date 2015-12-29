#! /bin/sh
NAME=""
EMAIL=""

mkdir -p $HOME/dev 2> /dev/null

# Install programs
echo 'Installing programs...'

echo 'Installing VIM'
cd $HOME/dev
git clone https://github.com/ceostrum/ceostrum.git
cd ceostrum/common
./vim_install.sh

echo 'Installing Google Chrome'
cd /tmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get -f install

echo 'Programs installed.'

# Configure programs
echo 'Configuring git...'
git config --global --replace-all user.name $NAME
git config --global --replace-all user.email $EMAIL
#git config --global push.default simple
#git config --global credential.helper cache
#git config --global credential.helper 'cache --timeout=3600'
echo 'Completed git.'

echo 'Configuring terminal'
if [ ! -d "$HOME/dev/gnome-terminal-colors-solarized" ]; then
  echo 'Setting up Gnome terminal solarized'
  cd $HOME/dev
  git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git
  gnome-terminal-colors-solarized/install.sh -s dark_alternative
fi

if [ ! -d "$HOME/dev/dircolors-solarized" ]; then
  echo 'Setting up dir colors'
  cd $HOME/dev
  git clone https://github.com/seebi/dircolors-solarized.git
  cp $HOME/dev/dircolors-solarized/dircolors.ansi-dark $HOME/.dir_colors
fi
