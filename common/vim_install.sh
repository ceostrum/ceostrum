#!/usr/bin/bash

# clone and compile in $HOME/dev
mkdir -p $HOME/dev/

# clone and make luajit
echo "Clone and compile luajit..."
cd $HOME/dev
git clone http://luajit.org/git/luajit-2.0.git luajit
cd luajit
make PREFIX=$HOME
make install PREFIX=$HOME

# clone and configure/make vim
echo "Clone and compile vim..."
cd $HOME/dev
git clone https://github.com/vim/vim.git vim
cd vim
./configure --with-features=huge --enable-multibyte --enable-rubyinterp --enable-pythoninterp --with-python-config-dir=$HOME/lib/python2.7/config --enable-perlinterp --enable-luainterp --with-luajit --with-lua-prefix=$HOME --enable-largefile --enable-gui=auto --enable-gtk2-check --enable-gnome-check --enable-cscope --prefix=$HOME --with-x --with-compiledby="Chris Ostrum" --enable-fail-if-missing
make
make install

# make necessary directories
mkdir -p $HOME/.vim/tmp
cd $HOME/.vim/tmp
mkdir backup swap undo

# get vimrc
git clone https://github.com/ceostrum/vimrc.git $HOME/.vim/vimrc
cd
ln -s .vim/vimrc/.vimrc .vimrc

git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/vundle.vim
vim +PluginInstall +qall
