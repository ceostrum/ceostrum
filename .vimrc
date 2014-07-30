" Modeline and Notes {
" Author: Chris Ostrum
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker 
" }

" Environment {

    " Basics {
    set nocompatible        " must be first line
    set background=dark     " Assume a dark background
    colorscheme desert
    "colorscheme wombat
    " }

    " Setup Bundle Support {
    " The next three lines ensure that the ~/.vim/bundle/ system works
        filetype off
        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()
    " }

    " Bundles {
    " Use bundles config
      if filereadable(expand("~/.vimrc.bundles"))
          source ~/.vimrc.bundles
      endif
    " }

" }

" General {

    if !has('gui')
        "set term=$TERM          " Make arrow and other keys work
    endif

    filetype plugin indent on   " Automatically detect file types.
    filetype plugin on
    syntax on                   " syntax highlighting
    scriptencoding utf-8

    set autoindent                                      " indent at the same level of the previous line
    set autoread ""
    set backspace=indent,eol,start                      " backspace for dummies
    "set backup                                          " backups are nice ...
    set binary                                          " make binary editable
    set cmdheight=2 "
    set complete-=i "
    set completeopt=menuone,preview "
    set equalalways "
    set expandtab                                       " tabs are spaces, not tabs
    set fillchars+=stl:\ ,stlnc:\ "
    set foldenable                                      " auto fold code
    set foldlevelstart=1
    set foldmarker={,}
    set foldmethod=marker
    "set foldmethod=indent "
    "set foldnestmax=3
    set hidden                                          " allow buffer switching without saving
    set history=10000                                   " Store a ton of history (default is 20)
    set hlsearch                                        " highlight search terms
    set ignorecase                                      " case insensitive search
    set incsearch                                       " find as you type search
    set infercase "
    set laststatus=2
    set lazyredraw "
    set linespace=0                                     " No extra spaces between rows
    set list
    set listchars=tab:,.,trail:.,extends:#,nbsp:.       " Highlight problematic whitespace
    set mouse=a                                         " automatically enable mouse usage
    set nobackup
    set swapfile
    set nowritebackup
    "set nohlsearch                                      " do not highlight search terms
    set nowrap                                          " wrap long lines
    set number                                          " Line numbers on
    set numberwidth=4 "
    set pastetoggle=<F12>                               " pastetoggle (sane indentation on pastes)
    set ruler                                           " show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)  " a ruler on steroids
    set scrolljump=5                                    " lines to scroll when cursor leaves screen
    set scrolloff=3                                     " minimum lines to keep above and below cursor
    set shell=/bin/bash "
    set shiftwidth=4                                    " use indents of 4 spaces
    "set shortmess+=filmnrxoOtT                          " abbrev. of messages (avoids 'hit enter')
    set shortmess=atI                                   " abbrev. of messages (avoids 'hit enter')
    set showcmd                                         " show partial commands in status line and
    set showmode                                        " display the current mode
    set showmatch                                       " show matching brackets/parenthesis
    set showtabline=2 "
    set sidescroll=1 "
    set sidescrolloff=15
    set smartcase                                       " case sensitive when uc present
    set softtabstop=4                                   " let backspace delete indent
    set splitright "
    set statusline=%<%f\    " Filename
    set statusline+=%w%h%m%r " Options
    "set statusline+=%{fugitive#statusline()} "  Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " filetype
    set statusline+=\ [%{getcwd()}]          " current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    set synmaxcol=1000 "
    "set spell                                           " spell checking on
    "set t_ti = t_te= "
    let &t_ti.="\e[1 q"
    let &t_SI.="\e[5 q"
    let &t_EI.="\e[1 q"
    let &t_te.="\e[0 q"
    set tabstop=4                                       " an indentation every four columns
    set textwidth=0 "
    set timeoutlen=200
    set title "
    set ttyfast "
    set undodir='/tmp' "
    set undofile                                        "so is persistent undo ...
    "set viewoptions=folds,options,cursor,unix,slash     " better unix / windows compatibility
    "set virtualedit=onemore                             " allow for cursor beyond last character
    set visualbell
    set whichwrap=b,s,h,l,<,>,[,],~                     " backspace and cursor keys wrap to
    set wildignore=.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.swf,*.egg,*.jar,*.dump,*.gem
    set wildmenu                                        " show list instead of just completing
    set wildmode=longest,list
    set wrap linebreak textwidth=0
" }

" AutoCmd {
  augroup vimrcEx

  " Remove all previously defined autocmds
  au!

  " Move to the last edited location
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  " Fugitive - remove when done
  "au BufReadPost fugitive://* set bufhidden=delete

  " Resize splits when the window is resized
  au VimResized * exe "normal! \<c-w>="
  au BufNewFile * set noeol

  " Track Quickfix Window
  au BufWinEnter quickfix call GetQuickFixBufferNumber()
  au BufWinLeave * call CheckIsQuickfixWindowClosing()

  au FileType slim set commentstring=/\ %s

  au FileType ruby setlocal tabstop=2
  au FileType ruby setlocal shiftwidth=2
  au FileType ruby setlocal softtabstop=2
  au FileType ruby setlocal commentstring=#\ %s
  au FileType python setlocal commentstring=#\ %s

  " AutoCmd : Files {
    au BufWinEnter,BufRead,BufNewFile Gemfile set ft=ruby
    if did_filetype()
      finish
    endif
    if getline(1) =~# '^#!.*/bin/env\s\+ruby\>'
      setfiletype ruby
    endif
    au FileType c,cpp,java,php,javascript,python,twig,xml,yml au BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
  " }

  augroup END

  " Autocmd: ListToggle {
    command! QToggle call QListToggle()

    function! QListToggle()
      if exists("t:quickfix_buffer_number")
        silent! cclose
      else
        silent! botright copen 10
      endif
    endfunction

    function! CheckIsQuickfixWindowClosing()
      if exists("t:quickfix_buffer_number") &&
            \ expand("<abuf>") == t:quickfix_buffer_number
        unlet! t:quickfix_buffer_number
      endif
    endfunction

    function! GetQuickFixBufferNumber()
      let t:quickfix_buffer_number = bufnr('$')
    endfunction
  " }

" }

" Key (re)Mappings {
  let mapleader = ','

  " Escape {
    vnoremap <c-@> <esc>
    inoremap <c-@> <esc>
    nnoremap <c-@> :noh<cr>
    vnoremap <leader><leader> <esc>
    inoremap <leader><leader> <esc>
    nnoremap <leader><leader> :noh<cr>
    "vnoremap <c-space> <esc>
    "inoremap <c-space> <esc>
    "nnoremap <c-space> :noh<cr>
  " }

  " Easier moving in tabs and windows
  nnoremap <C-J> <C-W>j
  nnoremap <C-K> <C-W>k
  nnoremap <C-L> <C-W>l
  nnoremap <C-H> <C-W>h
  nnoremap <C-W>3 :vs<cr>:vs<cr>
  nnoremap <C-W>4 :sp<cr>:vs<cr><C-W>j:vs<cr>

  " Map regular chars
  noremap ; :
  noremap 0 g^
  noremap ^ g0
  noremap $ g$
  nnoremap j gj
  nnoremap k gk

  " Code folding options
  nmap <leader>f0 :set foldlevel=0<CR>
  nmap <leader>f1 :set foldlevel=1<CR>
  nmap <leader>f2 :set foldlevel=2<CR>
  nmap <leader>f3 :set foldlevel=3<CR>
  nmap <leader>f4 :set foldlevel=4<CR>
  nmap <leader>f5 :set foldlevel=5<CR>
  nmap <leader>f6 :set foldlevel=6<CR>
  nmap <leader>f7 :set foldlevel=7<CR>
  nmap <leader>f8 :set foldlevel=8<CR>
  nmap <leader>f9 :set foldlevel=9<CR>

  "clearing highlighted search
  nmap <silent> <leader>/ :nohlsearch<CR>

  " Shortcuts
  " Change Working Directory to that of the current file
  cmap cwd lcd %:p:h
  cmap cd. lcd %:p:h

  nnoremap <Leader>w :w<CR>
  nnoremap <Leader>q :q<CR>

  " copy and paste
  vmap <Leader>y "+y
  vmap <Leader>d "+d
  nmap <Leader>p "+p
  nmap <Leader>P "+P
  vmap <Leader>p "+p
  vmap <Leader>P "+P

  " visual shifting (does not exit Visual mode)
  vnoremap < <gv
  vnoremap > >gv

  " For when you forget to sudo.. Really Write the file.
  cmap w!! w !sudo tee % >/dev/null

  " Some helpers to edit mode
  " http://vimcasts.org/e/14
  cnoremap %% <C-R>=expand('%:h').'/'<cr>
  map <leader>ew :e %%
  map <leader>es :sp %%
  map <leader>ev :vsp %%
  map <leader>et :tabe %%

  " Adjust viewports to the same size
  map <Leader>= <C-w>=

  " Easier horizontal scrolling
  map zl zL
  map zh zH

  "map Q to something useful
  noremap Q gq

  " Error jumping
  map cn <esc>:cn<cr>
  map cp <esc>:cp<cr>

  " Easy make
  map <leader>m :make<cr>

  nnoremap <leader>v :sp ~/.vimrc<cr>:sp ~/.vimrc.bundles<cr>
  nnoremap <leader>b :source ~/.vimrc<cr>
" }

" Plugins {
  " Better Whitespace {
    hi link ExtraWhitespace Error
  " }
  
  " CtrlP {
    let g:ctrlp_clear_cache_on_exit = 0
    let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
    let g:ctrlp_switch_buffer = 'e'
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_open_new_file = 'r'
    let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:40,results:40'
    let g:ctrlp_map = ''
    let g:ctrlp_prompt_mappings = {
    \ 'ToggleType(1)':        [''],
    \ 'ToggleType(-1)':       [''],
    \ 'PrtExit()':            ['<esc>', '<c-c>'],
    \ 'AcceptSelection("h")': ['<H>'],
    \ 'AcceptSelection("v")': ['<V>'],
    \ 'PrtBS()':              ['<c-h>', '<bs>'],
    \ 'PrtCurLeft()':         ['<c-b>'],
    \ 'PrtCurRight()':        ['<c-f>'],
    \ 'PrtClearCache()':      [','],
    \ 'PrtExpandDir()':       [''],
    \ 'PrtInsert("c")':       ['<c-p>'],
    \ }
  " }

  " CtrlSpace {
    let g:ctrlspace_default_mapping_key="<tab>"
    let g:airline_exclude_preview = 1
    let g:ctrlspace_show_unnamed=0
    let g:ctrlspace_show_key_info=1
    let g:ctrlspace_load_last_workspace_on_start=1
    let g:ctrlspace_save_workspace_on_exit=1
    hi link CtrlSpaceSelected Visual
    hi link CtrlSpaceNormal Normal
    hi link CtrlSpaceFound Search
  " }

  " Easy Align {
    " Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
    vmap <Enter> <Plug>(EasyAlign)

    " Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
    nmap <Leader>a <Plug>(EasyAlign)
  " }

  " Golden View {
    let g:goldenview__enable_default_mapping = 0
    let g:goldenview__enable_at_startup = 0
    " 'e' for expand
    nnoremap R :GoldenViewResize<cr>
  " }

  " Easymotion {
    let g:EasyMotion_do_mapping = 0
    let g:EasyMotion_keys = ';HKLYUIOPNM,QWERTASDGZXCVBJF'
    let g:EasyMotion_use_upper = 1
    let g:EasyMotion_smartcase = 1
    let g:EasyMotion_startofline = 0
    map  f <Plug>(easymotion-s2)
    xmap f <Plug>(easymotion-s2)
    omap f <Plug>(easymotion-t2)
    map J <Plug>(easymotion-j)
    map K <Plug>(easymotion-k)
    hi link EasyMotionTarget Todo
    hi link EasyMotionShade  Comment
    hi link EasyMotionTarget2First Todo
    hi link EasyMotionTarget2Second Todo
    hi link EasyMotionIncSearch IncSearch
    hi link EasyMotionIncCursor Search
  " }

  " GitGutter {
    let g:gitgutter_enabled = 0
    let g:gitgutter_realtime = 0
    let g:gitgutter_eager = 0
    let g:gitgutter_map_keys = 0
  " }

  " Move {
    let g:move_map_keys = 0
    vmap <c-j> <Plug>MoveBlockDown
    vmap <c-k> <Plug>MoveBlockUp
  " }

  " NerdTree {
      map <leader>d :NERDTreeToggle<CR>:NERDTreeMirror<CR>
      map <leader>e :NERDTreeFind<CR>
      nmap <leader>nt :NERDTreeFind<CR>

      let NERDTreeShowBookmarks=1
      let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
      let NERDTreeChDirMode=2
      let NERDTreeQuitOnOpen=1
      let NERDTreeMouseMode=2
      let NERDTreeShowHidden=1
      let NERDTreeKeepTreeInNewTab=1
      let g:nerdtree_tabs_open_on_gui_startup=0
  " }

  " YouCompleteMe {
    let g:ycm_key_detailed_diagnostics = ''
    let g:ycm_key_invoke_completion = ''
    let g:ycm_complete_in_strings=0
  " }
" }
