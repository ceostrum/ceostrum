set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'juneedahamed/svnj.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'lokaltog/vim-easymotion'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/emmet-vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sheerun/vim-polyglot'
Plugin 'szw/vim-maximizer'
Plugin 'szw/vim-tags'
Plugin 'Shuogo/neocomplete'
Plugin 'Shuogo/neosnippet'
Plugin 'Shuogo/neosnippet-snippets'
Plugin 'thinca/vim-visualstar'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/IndexedSearch'

call vundle#end()
filetype plugin indent on

"colorscheme desert
colorscheme solarized

source ~/.vim/base.vim
source ~/.vim/ignore.vim
source ~/.vim/autocmd.vim
source ~/.vim/functions.vim
source ~/.vim/plugins.vim
source ~/.vim/mappings.vim
