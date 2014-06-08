if has('gui_running') && !has('unix')
  set encoding=utf-8
endif
scriptencoding cp932
set fileencoding=utf-8

set nocompatible
filetype off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#rc(expand('~/.vim/bundle/'))
endif

" originalrepos on github

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'surround.vim'
NeoBundle 'open-browser.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'tell-k/vim-browsereload-mac'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'kevinw/pyflakes-vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'thinca/vim-ref'
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'
         
filetype plugin indent on
filetype indent on
syntax on

"文字がない場所にもカーソルを移動できるようにする
set virtualedit=all
set number

"入力モード中に素早くJJと入力した場合はESCとみなす
inoremap jj <Esc>

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

inoremap ( ()<LEFT>
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap " ""<LEFT>
inoremap < <><LEFT>
inoremap ' ''<LEFT>

"Ctrl+hjklでウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" 対応するタグにジャンプ
:source $VIMRUNTIME/macros/matchit.vim

"----------------------------------------
" zencoding
"----------------------------------------
" codaのデフォルトと一緒にする
imap <C-E> <C-Y>,
let g:user_zen_leader_key = '<C-Y>'
" 言語別に対応させる
let g:user_zen_settings = {
      \  'lang' : 'ja',
      \  'html' : {
      \    'filters' : 'html',
      \    'indentation' : ' '
      \  },
      \  'css' : {
      \    'filters' : 'fc',
      \  },
      \}
 
"----------------------------------------
" open-browsere
"----------------------------------------
" カーソル下のURLをブラウザで開く
nmap <Leader>o <Plug>(openbrowser-open)
vmap <Leader>o <Plug>(openbrowser-open)
" ググる
nnoremap <Leader>g :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>
 
 
"----------------------------------------
" vim-browsereload-mac
"----------------------------------------
" リロード後に戻ってくるアプリ 変更してください
let g:returnApp = "iTerm"
nmap <Space>bc :ChromeReloadStart<CR>
nmap <Space>bC :ChromeReloadStop<CR>
nmap <Space>bf :FirefoxReloadStart<CR>
nmap <Space>bF :FirefoxReloadStop<CR>
nmap <Space>bs :SafariReloadStart<CR>
nmap <Space>bS :SafariReloadStop<CR>
nmap <Space>bo :OperaReloadStart<CR>
nmap <Space>bO :OperaReloadStop<CR>
nmap <Space>ba :AllBrowserReloadStart<CR>
nmap <Space>bA :AllBrowserReloadStop<CR>
 
"-----------------------------------
"NERDTree
"-----------------------------------
nmap <F9> :NERDTreeToggle

"------------------------------------
" sass
"------------------------------------
let g:sass_compile_auto   = 1
let g:sass_compile_cdloop = 5
let g:sass_compile_cssdir = ['css', 'stylesheet']
let g:sass_compile_file   = ['scss', 'sass']
let g:sass_started_dirs   = []
 
autocmd FileType scss,less,sass  setlocal sw=2 sts=2 ts=2 et
au! BufWritePost * SassCompile

"-----------------------------------
"for snippet
"-----------------------------------
imap <expr><C-o> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <C-o> <Plug>(neocomplcache_snippets_expand)
" Plugin key-mappings.
imap <C-o>     <Plug>(neosnippet_expand_or_jump)
smap <C-o>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
"Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/mysnippets'

"pythonの構文チェックについて
let g:syntastic_mode_map = {
	\ 'mode': 'active',
  \ 'active_filetypes': ['php','vim'],
	\ 'passive_filetypes': ['html', 'python']
	\ }

"vim でpythonを起動する。
function! s:Exec()
    exe "!" . &ft . " %"        
:endfunction         
command! Exec call <SID>Exec() 
map <silent> <C-P> :call <SID>Exec()<CR>
