set nocompatible

if has('gui_running') && !has('unix')
  set encoding=utf-8
endif
scriptencoding cp932
set fileencoding=utf-8

function! s:WithoutBundles()
	colorscheme desert
endfunction

function! s:InitNeoBundle()
	if isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
		filetype plugin indent off
		if has('vim_starting')
			set runtimepath+=~/.vim/bundle/neobundle.vim/
		endif
		try
			call neobundle#begin(expand('~/.vim/bundle/'))
			NeoBundle 'Shougo/neobundle.vim'
			NeoBundle 'Shougo/vimproc',{ 
				\ 'build':{
				\	'windows':'tools\\update-dll-mingw',
				\	'cygwin':'make -f make_cygwin.mak',
				\	'mac':'make -f make_mac.mak',
				\	'unix':'make -f make_unix.mak',
				\	},
				\}
			NeoBundle 'VimClojure'
			NeoBundle 'Shougo/vimshell'
			NeoBundle 'Shougo/unite.vim'
			NeoBundle 'Shougo/neossh.vim'
			NeoBundle 'Shougo/neocomplcache'
			NeoBundle 'Shougo/neosnippet'
			NeoBundle 'Shougo/neomru.vim'
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
			call neobundle#end()
		catch 
			call s:WithoutBundles()
		endtry
	else
		call s:WithoutBundles()
	endif

	filetype indent plugin on
endfunction

call s:InitNeoBundle()

syntax on 
"クリップボードの連携(mac)
set clipboard+=unnamed
"文字がない場所にもカーソルを移動できるようにする
set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
"移動コマンドを使ったとき、行頭に移動しない
set nostartofline
"検索結果をハイライト表示する
set hlsearch
"バックスペースでインデントを削除できるようにする
set backspace=indent,eol,start
"言語別にインデント幅を変える
augroup vimrc
autocmd! FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd! FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType css  setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType ruby  setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup END

set autoindent
"入力モード中に素早くJJと入力した場合はESCとみなす
inoremap jj <Esc>

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

inoremap () ()<LEFT>
inoremap {} {}<LEFT>
inoremap [] []<LEFT>
inoremap "" ""<LEFT>
inoremap <> <><LEFT>
inoremap '' ''<LEFT>

"Ctrl+hjklでウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
let mapleader = ","
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
"let g:sass_compile_auto   = 1
"let g:sass_compile_cdloop = 5
"let g:sass_compile_cssdir = ['css', 'stylesheet']
"let g:sass_compile_file   = ['scss', 'sass']
"let g:sass_started_dirs   = []
 
"autocmd FileType scss,less,sass  setlocal sw=2 sts=2 ts=2 et
"au! BufWritePost * SassCompile

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
                    " Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline. タブ関連の設定
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ


"" unite.vim {{{
" The prefix key.
nnoremap    [unite]   <Nop>
nmap    <Leader>f [unite]
 
" unite.vim keymap
" https://github.com/alwei/dotfiles/blob/3760650625663f3b08f24bc75762ec843ca7e112/.vimrc
nnoremap [unite]u  :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]r :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> ,vr :UniteResume<CR>
 
" vinarise
let g:vinarise_enable_auto_detect = 1
 
" unite-build map
nnoremap <silent> ,vb :Unite build<CR>
nno"" unite-grep {{{
" unite-grepのバックエンドをagに切り替える
" http://qiita.com/items/c8962f9325a5433dc50d
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_max_candidates = 200
 
" unite-grepのキーマップ
" 選択した文字列をunite-grep
" https://github.com/shingokatsushima/dotfiles/blob/master/.vimrc
vnoremap /g y:Unite grep::-iHRn:<C-R>=escape(@", '\\.*$^[]')<CR><CR>
" }}}remap <silent> ,vcb :Unite build:!<CR>
nnoremap <silent> ,vch :UniteBuildClearHighlight<CR>
"" }}}


function! s:open_kobito(...)
	if a:0 == 0
		call system('open -a Kobito '.expand('%:p'))
	else
		call system('open -a Kobito '.join(a:000, ' '))
	endif
endfunction

"引数のファイル(複数指定可)を Kobitoで開く
" （引数無しのときはカレントバッファを開く
command! -nargs=* Kobito call s:open_kobito(<f-args>)
" Kobito を閉じる
command! -nargs=0 KobitoClose call system("osascript -e 'tell application\"Kobito\" to quit'")
" Kobito にフォーカスを移す
command! -nargs=0 KobitoFocus call system("osascript -e 'tell application\"Kobito\" to activate'")


" ,is: シェルを起動
nnoremap <silent> ,is :VimShell<CR>
" ,ipy: pythonを非同期で起動
nnoremap <silent> ,ipy :VimShellInteractive python<CR>
" ,irb: irbを非同期で起動
nnoremap <silent> ,irb :VimShellInteractive irb<CR>
" ,ss: 非同期で開いたインタプリタに現在の行を評価させる
vmap <silent> ,ss :VimShellSendString<CR>
" 選択中に,ss: 非同期で開いたインタプリタに選択行を評価させる
nnoremap <silent> ,ss <S-v>:VimShellSendString<CR>
