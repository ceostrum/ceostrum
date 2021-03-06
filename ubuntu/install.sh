#! /bin/sh
NAME=""
EMAIL=""

mkdir -p $HOME/dev 2> /dev/null

echo 'Installing prerequisites...'
sudo apt-get install -y automake libevent-dev libncurses5-dev tmux libperl-dev libpython-dev

echo 'Configuring git...'
git config --global --replace-all user.name $NAME
git config --global --replace-all user.email $EMAIL
git config --global push.default simple
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'
echo 'Completed git.'

if [ ! -d "$HOME/.solarized" ]; then
  echo 'Setting up solarized'
  mkdir -p $HOME/.solarized
  cd $HOME/.solarized
  git clone https://github.com/seebi/dircolors-solarized.git
  eval `dircolors ~/.solarized/dircolors-solarized/dircolors.ansi-dark`
  ln -s ~/.solarized/dircolors-solarized/dircolors.256dark ~/.dir_colors

  git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git
  cd gnome-terminal-colors-solarized
  ./install.sh -s dark_alternative
fi

echo 'Setting up Dotfiles'
cd $HOME/dev
git clone https://github.com/ceostrum/dotfiles.git
cp dotfiles/.* $HOME

echo 'Installing Ruby'
gpg --keyserver hkp://pgp.mit.edu:80 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s -- --ignore-dotfiles
. $HOME/.rvm/scripts/rvm
rvm install  2.2
rvm use 2.2

echo 'Installing VIM'
cd $HOME/dev/ceostrum/common
sh vim_install.sh

echo 'Installing Google Chrome'
cd /tmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get -f install -y

