" Use control space to esc out of any mode
nnoremap <c-space> <esc>:noh<cr>
vnoremap <c-space> <esc>gV
onoremap <c-space> <esc>
cnoremap <c-space> <C-c>
inoremap <c-space> <esc>`^
" terminal uses control @...
nnoremap <c-@> <esc>:noh<cr>
vnoremap <c-@> <esc>gV
onoremap <c-@> <esc>
cnoremap <c-@> <C-c>
inoremap <c-@> <esc>`^

map     e <Plug>(easymotion-sn)
noremap : ;
noremap ; :
noremap 0 g^
noremap ^ g0
noremap $ g$
noremap j gj
noremap k gk
noremap J 3j
noremap K 3k
nnoremap x "_x
nnoremap s :w<cr>
nnoremap S :sp<cr>
nnoremap q <nop>
nnoremap Q :q<cr>
nnoremap C :call ToggleQuickfix()<cr>

nnoremap th :tabp<cr>
nnoremap tl :tabn<cr>
noremap gv `[v`]
vnoremap < <gv
vnoremap > >gv

cnoremap %% <C-R>=expand('%:h').'/'<cr>

vnoremap <c-j> :join<cr>
vnoremap <c-y> "+y
noremap <c-p> "+p
set pastetoggle=<F10>
inoremap <c-p> <F10><C-r>+<F10>
inoremap <c-h> <bs>

cnoremap <c-p> <c-r>+
cnoremap <c-v> <c-r>"
cnoremap <c-a> <Home>
cnoremap <c-e> <End>
cnoremap <c-b> <Left>
cnoremap <c-f> <Right>
cnoremap <c-j> <t_kd>
cnoremap <c-k> <t_ku>

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

nnoremap <space> :NERDTreeToggle<cr>
nnoremap <leader><space> <nop>
nnoremap <leader>. :NERDTreeFind<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
"nnoremap <leader>d :call RunLastSpec()<CR>
nnoremap <leader>e :CtrlP .<cr>
nnoremap <leader>f :CtrlPTag<CR>
nnoremap <leader>g :TagbarToggle<CR>
nnoremap <leader>h :nohlsearch<CR>
nnoremap <leader>i <nop>
nnoremap <leader>j <nop>
nnoremap <leader>m :MaximizerToggle<CR>
nnoremap <leader>n :call RenameFile()<cr>
nnoremap <leader>o <nop>
nnoremap <leader>p <nop>
"nnoremap <leader>q :qall!
nnoremap <leader>q :qall
nnoremap <silent> <leader>r :call ri#OpenSearchPrompt(0)<cr>
nnoremap <silent> <leader>R :call ri#OpenSearchPrompt(1)<cr>
nnoremap <silent> <leader>s :call ri#LookupNameUnderCursor()<cr>
nnoremap <leader>u :source ~/.vimrc<cr>
nnoremap <leader>v :sp ~/.vimrc<cr>:vs ~/.vim/mappings.vim<cr>:sp ~/.vim/base.vim<cr>:vs ~/.vim/plugins.vim<cr>
nnoremap <leader>w <nop>
nnoremap <leader>x <nop>
nnoremap <leader>y <nop>
nnoremap <leader>z <nop>
nnoremap <leader><leader>s :Ag <Space>-G="*"<S-Left><Left>
nnoremap <leader><leader>c :Ag <Space>-G="*.(css\|scss)" app<S-Left><S-Left><Left>
nnoremap <leader><leader>j :Ag <Space>-G="*.(js\|coffee)" app<S-Left><S-Left><Left>
nnoremap <leader><leader>r :Ag <Space>-G="*.(rb\|rake)"<S-Left><Left>
nnoremap <leader><leader>t :Ag <Space>-G="*_spec.rb" spec<S-Left><S-Left><Left>
nnoremap <leader><leader>v :Ag <Space>-G="*.(erb\|slim)" app<S-Left><S-Left><Left>
