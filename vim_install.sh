#!/usr/bin/bash

clear
mkdir -p $HOME/dev/

echo "Clone and compile luajit..."
cd $HOME/dev
git clone http://luajit.org/git/luajit-2.0.git luajit
cd luajit
make PREFIX=$HOME
make install PREFIX=$HOME

echo "Clone and compile vim..."
cd $HOME/dev
git clone https://github.com/vim/vim.git vim
cd vim
./configure --with-features=huge --enable-multibyte --enable-rubyinterp --enable-pythoninterp --with-python-config-dir=$HOME/lib/python2.7/config --enable-perlinterp --enable-luainterp --with-luajit --with-lua-prefix=$HOME --enable-largefile --enable-gui=gtk2 --enable-cscope --prefix=$HOME --enable-fail-if-missing
make
make install
