" vim:set ts=8 sts=2 sw=2 tw=0:

" 日本語入力用のkeymapの設定例 (コメントアウト)
if has('keymap')
  " ローマ字仮名のkeymap
  silent! set keymap=japanese
  set iminsert=0 imsearch=0
endif

"---------------------------------------------------------------------------
" コンソール版で環境変数$DISPLAYが設定されていると起動が遅くなる件へ対応
if !has('gui_running') && has('xterm_clipboard')
  set clipboard=exclude:cons\\\|linux\\\|cygwin\\\|rxvt\\\|screen
endif

"---------------------------------------------------------------------------
" プラットホーム依存の特別な設定
if has('mac')
  " Macではデフォルトの'iskeyword'がcp932に対応しきれていないので修正
  set iskeyword=@,48-57,_,128-167,224-235
endif

"プラグインを有効にする
filetype plugin indent on 

"---------------------------------------------------------------------------
" 検索の挙動に関する設定:
"
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase
"---------------------------------------------------------------------------
" 編集に関する設定:
"
" タブの画面上での幅
set tabstop=4
" タブをスペースに展開しない (expandtab:展開する)
set noexpandtab
"set expandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:
"
" 相対行番号を表示 (number:表示)
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (nolist:非表示)
set list
" どの文字でタブや改行を表示するかを設定
"set listchars=tab:>-,extends:<,trail:-,eol:<
"set listchars=tab:^\ ,eol:_
set listchars=tab:>\ ,trail:-
" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title


" gvimで'ja'となっていてPlugUpdate等のときにperlのwarningが出ていたので、
" 試しにこのように変えてみる。
let $LANG='ja_JP.UTF-8'

let mapleader='\'

" 20140404 crontab -e で編集できない現象への対応
set backupskip=/tmp/*,/private/tmp/*

" cygwin上でEscの反応を早くしたい 上手くいくかな？
set timeout timeoutlen=1000 ttimeoutlen=30

" trial: refs: http://qiita.com/yohawing/items/d04408a15f2f13176961
set wildignore+=*.exe,*.dll,*.so,*.bin,*.class,*.jar,*.zip,*.jpg,*.jpeg,*.gif,*.png

set wildignorecase

set shellslash
set shellpipe=2>\&1\|nkf\ -us>%s

"コマンドラインをEmacs風に編集する
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
":cnoremap <C-F> <Right>
":cnoremap <C-B> <Left>

" ctags使ってみる
set tags+=tags;
set tags+=$HOME/.tags/tags

set helplang=ja,en
set showtabline=2
set guioptions-=T "ツールバー非表示
set guioptions-=m "メニューバー非表示
set smartindent
set shiftwidth=4
set noscrollbind
set directory=$HOME/.config/nvim/swap
set backupdir=$HOME/.config/nvim/backup
set undodir=$HOME/.config/nvim/undo
set fileencodings=utf-8,cp932
set fileencoding=utf-8
set fileencodings=utf-8,cp932
set fileformats=unix,dos
set fileformat=unix
" set statusline=%t\ %m\ %=[%Y\ %{&ff}\ %{&fileencoding}]\ %l/%L\ %p%%
set statusline=[%{mode()}]\ %t\ %m\ %=[%Y\ %{&ff}\ %{&fileencoding}]\ %l/%L\ %p%%
set splitbelow
set splitright
set nrformats="alpha,hex"
set diffopt=vertical
set history=100
set virtualedit+=block "test:矩形ヴィジュアルモードで仮想編集ON
set grepprg=jvgrep
set ttyfast
set ambiwidth=double
set synmaxcol=200

set breakindent
" set breakindentopt=shift:1
set showbreak=\|\ 
" TODO: 暫定的にBufEnterでやる
aug BREAK_INDENT
  au!
  au BufEnter * hi NonText ctermfg=60 guifg=#5F5F87
aug END


" 勝手に末行を変更しない
" refs: https://github.com/vim-jp/issues/issues/152
silent! set nofixendofline

" .gvimrcにも書いてある。
set cursorline
hi clear CursorLine

let g:markdown_fenced_languages = [
\  'css',
\  'javascript',
\  'js=javascript',
\  'json=javascript',
\  'java=java',
\  'xml',
\]

""AutoChangeDirectory
aug CD
  au!
  " vimfilerを除外する
  " au BufEnter * if expand("%:p:h:t") != "vimfiler" | execute ":lcd " . expand("%:p:h") | endif
  au BufEnter * if expand("%:p:h:t") != "vimfiler" && expand("%:p") !~ '://' | execute ":lcd " . expand("%:p:h") | endif
aug END

" unix固有の設定
if has("win64") " 64bit_windows固有の設定
elseif has("win32unix") " Cygwin固有の設定
  "let &t_ti .= "\e[1 q"  " 端末を termcap モードにする
  let &t_SI .= "\e[5 q"  " 挿入モード開始(バー型のカーソル)
  let &t_EI .= "\e[1 q"  " 挿入モード終了(ブロック型カーソル)
  "let &t_te .= "\e[0 q"  " termcap モードから抜ける
elseif has("win32") " 32bit_windows固有の設定
  let g:unite_source_find_command="C:/cygwin/bin/find.exe"
endif

"----------------------------------------
" map
"----------------------------------------

" 折りたたみを使ってみる
nnoremap zz zR
nnoremap Z zM
vnoremap z zf
" l で折りたたみを開く
nnoremap <expr>l  foldclosed('.') != -1 ? 'zo' : 'l'

nmap ,w <C-w>

" test
nnoremap gl $
nnoremap gL $
nnoremap gh ^
nnoremap gH 0

nnoremap <silent><SID>(gt) gt
nnoremap <silent><SID>(gT) gT
" nnoremap <silent><C-j><C-j> :<C-u>call <SID>my_double_esc_function()<CR>
nnoremap <silent>gb :<C-u>bn<CR>
nnoremap <silent>gB :<C-u>bp<CR>
nnoremap Y y$
nnoremap <silent> ,r :<C-u>set relativenumber!<CR>
nnoremap <silent> <SPACE>r :<C-u>set relativenumber!<CR>

" inoremap () ()<C-g>U<LEFT>
" inoremap ()) ()
" " inoremap ()( ()<C-g>U<LEFT>
" inoremap {} {}<C-g>U<LEFT>
" inoremap {}} {}
" " inoremap {}{ {}<C-g>U<LEFT>
" inoremap [] []<C-g>U<LEFT>
" inoremap []] []
" " inoremap [][ []<C-g>U<LEFT>
" inoremap <>> <><C-g>U<LEFT>
" inoremap <>> <>
" " inoremap <>< <><C-g>U<LEFT>
" " inoremap "" ""<C-g>U<LEFT>
" " inoremap '' ''<C-g>U<LEFT>

nmap <tab> <C-w>w
"nnoremap - ^
nnoremap - 0
nnoremap Y y$
nnoremap + ,

" 関連付けされたプログラムで開く(Windowsのみ)
if has("win32")
  :command! Open :!start cmd /c %<CR>
endif

" 20140723
nnoremap <silent><Esc><Esc> :<C-u>call <SID>my_double_esc_function()<CR>
function! s:my_double_esc_function()
  pclose
  QuickhlManualReset
  let @/ = '' "Nohlsearch
  set norelativenumber
endfunction

set cmdwinheight=6
augroup MyVimrc
  autocmd!
  autocmd FileType ref-webdict nnoremap <buffer> q <C-w>c
  autocmd FileType help nnoremap <buffer> q <C-w>c
  autocmd FileType qf nnoremap <buffer> q <C-w>c
  autocmd FileType qf nnoremap <buffer> p <CR>zz<C-w>p
  autocmd FileType w3m nnoremap <buffer><silent> q :W3mClose<CR>
  autocmd CmdwinEnter * nnoremap <buffer> qq <C-w>c
  autocmd CmdwinEnter * startinsert
  autocmd CmdwinEnter * set cmdheight=1
  autocmd CmdwinLeave * set cmdheight=2

  " md as markdown, instead of modula2
  autocmd BufNewFile,BufRead *.{md,mkd} set filetype=markdown
  " vue as vue
  autocmd BufNewFile,BufRead *.vue set filetype=vue
  " autocmd BufNewFile,BufRead *.vue set filetype=html.vue
augroup END

augroup MyAutoCmd
  autocmd!
augroup END


"netrw ---------------------------------
" let g:netrw_liststyle=3
augroup MyNETRW
  autocmd!
  autocmd FileType netrw nnoremap <buffer> q :<C-u>bd<CR>
  autocmd FileType netrw nmap <buffer> h -
  autocmd FileType netrw nmap <buffer> l <CR>
augroup END

"quickfix ------------------------------
map ,c [quickfix]
nnoremap [quickfix]c :<C-u>copen<CR>
nnoremap [quickfix]o :<C-u>copen<CR>
nnoremap [quickfix]n :<C-u>cn<CR>
nnoremap [quickfix]p :<C-u>cp<CR>
autocmd QuickfixCmdPost grep,grepadd if len(getqflist()) != 0 | copen | endif

" insertmode時、statuslineの色を変更 ----------
if !exists('g:hi_insert_statusline')
  let g:hi_insert_statusline = 'highlight StatusLine guifg=white guibg=darkcyan gui=none ctermfg=white ctermbg=darkcyan cterm=none'
endif
if !exists('g:hi_insert_linenr')
  let g:hi_insert_linenr = 'highlight LineNr ctermfg=67 guifg=#747bA1'
endif

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
let s:lnnrhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent! let s:lnnrhlcmd = 'highlight ' . s:GetHighlight('LineNr')
    silent exec g:hi_insert_statusline
    silent exec g:hi_insert_linenr
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
    highlight clear LineNr
    silent exec s:lnnrhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction


" zoom --------------------------------------------------
nnoremap <silent> <Plug>(my_zoom_in)  :<C-u>call <SID>Zoom( 1)<CR>
nnoremap <silent> <Plug>(my_zoom_out) :<C-u>call <SID>Zoom(-1)<CR>

noremap [zoom] <Nop>
map ,z [zoom]

function! s:Zoom(value)
  let l:fsize = substitute(&guifont, '^.*:h\([^:]*\).*$', '\1', '')
  let l:fsize += a:value
  let l:guifont = substitute(&guifont, ':h\([^:]*\)', ':h' . l:fsize, '')
  let &guifont = l:guifont
endfunction

" Jq --------------------------------------------------
" TODO: jq未インストールの場合
:command! Jq :%!jq '.'

" terminal ------------------------------
noremap [terminal] <Nop>
map ,t [terminal]
nnoremap <silent> [terminal]c : <C-u>terminal ++curwin ++close<CR>
nnoremap <silent> [terminal]t : <C-u>terminal ++curwin ++close<CR>
nnoremap <silent> [terminal]b : <C-u>terminal ++curwin ++close bash<CR>
nnoremap <silent> [terminal]s : <C-u>terminal ++curwin ++close bash<CR>

