#!/usr/bin/bash

# need cmake, libx11-dev, libxtst-dev, libxt-dev, libsm-dev, libxpm-dev, python-devel

# clone and compile in $HOME/dev
mkdir -p $HOME/dev/ 2> /dev/null

# clone and make luajit
echo "Clone and compile luajit..."
cd $HOME/dev
git clone http://luajit.org/git/luajit-2.0.git luajit
cd luajit
make PREFIX=$HOME
make install PREFIX=$HOME
cd
rm -rf $HOME/dev/luajit

# if ubuntu here ?
mkdir -p $HOME/lib/x86_64-linux-gnu
sudo ln -s /home/oz/lib/libluajit-5.1.so /home/oz/lib/x86_64-linux-gnu/libluajit-5.1.so

# clone and configure/make vim
echo "Clone and compile vim..."
cd $HOME/dev
git clone https://github.com/vim/vim.git vim
cd vim/src
make distclean
./configure --with-features=huge --enable-multibyte --enable-rubyinterp --enable-pythoninterp --with-python-config-dir=$HOME/lib/python2.7/config --enable-perlinterp --enable-luainterp --with-luajit --with-lua-prefix=$HOME --enable-largefile --disable-gui --without-x --enable-cscope --prefix=$HOME --with-compiledby="Chris Ostrum" --enable-fail-if-missing
make
make install
cd
rm -rf $HOME/dev/vim

# make necessary directories
mkdir -p $HOME/.vim/tmp
cd $HOME/.vim/tmp
mkdir backup swap undo

echo "Setup bundles..."
git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/vundle.vim
vim +PluginInstall +qall

echo "Compile YCM..."
cd $HOME/dev
mkdir ycm_build
cd ycm_build
cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
make ycm_support_libs
rm -rf $HOME/dev/ycm_build

echo "Complete!"
