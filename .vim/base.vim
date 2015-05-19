syntax on
let mapleader = ","
runtime macros/matchit.vim

"let g:solarized_termcolors=256

if &diff
    " diff mode
    set diffopt+=iwhite
    syntax off
endif

set autoindent
set autoread ""
set background=dark                                 " Assume a dark background
set backspace=indent,eol,start                      " backspace for dummies
set binary                                          " make binary editable
set cmdheight=2 "
set complete-=i "
set completeopt=menuone,preview "
set equalalways "
set expandtab                                       " tabs are spaces, not tabs
set fillchars+=stl:\ ,stlnc:\ "
set foldenable                                      " auto fold code
set foldlevelstart=10
set foldmarker={,}
set foldmethod=marker
"set foldmethod=indent "
" set foldnestmax=3
set hidden                                          " allow buffer switching without saving
set history=10000                                   " Store a ton of history (default is 20)
set hlsearch                                        " highlight search terms
set ignorecase                                      " case insensitive search
set incsearch                                       " find as you type search
set infercase "
set laststatus=2
set lazyredraw "
"set mouse=a                                         " automatically enable mouse usage
set nobackup
set noswapfile
set nowritebackup
set nowrap                                          " wrap long lines
set number                                          " Line numbers on
set numberwidth=4 "
"set ruler                                           " show the ruler
"set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)  " a ruler on steroids
set scrolljump=5                                    " lines to scroll when cursor leaves screen
set scrolloff=3                                     " minimum lines to keep above and below cursor
"set shell=/bin/bash\ -i "
set shiftwidth=4                                    " use indents of 4 spaces
set shortmess=atI                                   " abbrev. of messages (avoids 'hit enter')
"set showcmd                                         " show partial commands in status line and
set showmode                                        " display the current mode
set showmatch                                       " show matching brackets/parenthesis
set showtabline=2 "
set sidescroll=1 "
set sidescrolloff=15
set smartcase                                       " case sensitive when uc present
set softtabstop=4                                   " let backspace delete indent
set splitright "
"set statusline=%<%f\    " Filename
"set statusline+=%w%h%m%r " Options
""set statusline+=%{fugitive#statusline()}            "  Git Hotness
"set statusline+=\ [%{&ff}/%Y]                       " filetype
"set statusline+=\ [%{getcwd()}]                     " current dir
"set statusline+=%=%-14.(%l,%c%V%)\ %p%%             " Right aligned file nav info
set synmaxcol=1000 "
"set spell                                           " spell checking on
set t_Co=16
set t_ut=
set tabstop=4                                       " an indentation every four columns
set textwidth=0 "
"set timeoutlen=200
""set title "
set ttyfast "
"set undodir='/tmp' "
"set undofile                                        "so is persistent undo ...
set virtualedit=onemore                             " allow for cursor beyond last character
set visualbell
set whichwrap=b,s,h,l,<,>,[,],~                     " backspace and cursor keys wrap to
set wildmenu                                        " show list instead of just completing
set wildmode=longest,list
set wrap linebreak textwidth=0
set tags+=gems.tags
set tags+=tags;/
set tags+=/$HOME/.tags/tags
