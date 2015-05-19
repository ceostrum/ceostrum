hi link ExtraWhitespace Error

" ctrlp
" let g:ctrlp_user_command = 'find %s -type f'
" if executable('/home/costrum/bin/ag')
set grepprg=ag\ --nogroup\ --nocolor\ --column
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
" endif

let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_switch_buffer = 'e'
" NOTE: If %s is not a directory that already exists, it'll fail, so I can't
" do something like split %s and pass it to xargs.
let g:ctrlp_working_path_mode = 'ra'
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

" Emmet
let g:user_emmet_leader_key='<c-e>'

" NerdTree
let g:NERDTreeChDirMode=2
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeHijackNetrw = 0
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1

"let g:ycm_key_detailed_diagnostics = ''
"let g:ycm_key_invoke_completion = ''
"let g:ycm_complete_in_strings=0

"vim-tags
let g:vim_tags_use_vim_dispatch=1
let g:vim_tags_ctags_binary="~/bin/ctags""

" tagbar
let g:tagbar_autofocus=1
let g:tagbar_compact=1
let g:tagbar_show_visibility=1

" surround
vmap s S
" Key: "-"
let g:surround_45 = "<% \r %>"
" Key: "="
let g:surround_61 = "<%= \r %>"
" Key: "``"
let g:surround_33 = "```\r```"

" rspec
let g:rspec_command = "Dispatch rspec {spec}"

" ag
let g:agprg="/home/costrum/bin/ag --nogroup --column"

" neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_camel_case = 1
let g:neocomplete#enable_smart_case = 1

" Default # of completions is 100, that's crazy.
let g:neocomplete#max_list = 10
" Set minimum syntax keyword length.
let g:neocomplete#auto_completion_start_length = 3

" Plugin key-mappings
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: pumvisible() ? "\<C-n>" : "\<TAB>"
"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: "\<TAB>"

inoremap <expr><c-g> neocomplete#undo_completion()
inoremap <expr><c-l> neocomplete#complete_common_string()

"inoremap <silent> <cr> <c-r>=<SID>my_cr_function()<cr>
"function! s:my_cr_function()
"    return neocomplete#close_popup()
"endfunction

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplete#close_popup()
inoremap <expr><C-e> neocomplete#cancel_popup()

" This makes sure we use neocomplete completefunc instead of
" the one in rails.vim, otherwise this plugin will crap out.
let g:neocomplete#force_overwrite_completefunc = 1

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets'

" Easy-motion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags ts=2 sts=2 sw=2
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete ts=2 sts=2 sw=2
