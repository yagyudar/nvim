"===== ctrlp =====
nnoremap [ctrlp] <Nop>
nmap ,p [ctrlp]
" uiki
nnoremap <expr>[ctrlp]i ':<C-u>CtrlP '. g:unite_uiki_path . '<CR>'
nnoremap [ctrlp]p :<C-u>CtrlP<CR>
nnoremap [ctrlp]b :<C-u>CtrlPBuffer<CR>
nnoremap [ctrlp]d :<C-u>CtrlPDir<CR>
" nnoremap [ctrlp]l :<C-u>CtrlPLine %<CR>
nnoremap [ctrlp]l :<C-u>CtrlPLine<CR>
nnoremap [ctrlp]m :<C-u>CtrlPMRUFiles<CR>
nnoremap [ctrlp]x :<C-u>CtrlPMixed<CR>
nnoremap [ctrlp]y :<C-u>CtrlPYankRound<CR>
let g:ctrlp_map = '<Nop>'
" Guess vcs root dir
let g:ctrlp_working_path_mode = 'ra'
" Open new file in current window
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_extensions = ['dir', 'mixed']
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:18'
let g:ctrlp_tilde_homedir=1
let g:ctrlp_max_files = 20000
"===== /ctrlp =====

"===== fzf =====
nnoremap [fzf] <Nop>
nmap ,f [fzf]
nnoremap <silent> [fzf]f :call fzf#vim#files('', 0)<CR>
nnoremap <silent> [fzf]g :call fzf#vim#gitfiles('', 0)<CR>
nnoremap <silent> [fzf]b :call fzf#vim#buffers('', 0)<CR>
nnoremap <silent> [fzf]a :call fzf#vim#ag('', 0)<CR>
nnoremap <silent> [fzf]h :call fzf#vim#history(0)<CR>
nnoremap <silent> [fzf]m :call fzf#vim#history(0)<CR>
nnoremap <silent> [fzf]: :call fzf#vim#command_history(0)<CR>
nnoremap <silent> [fzf]/ :call fzf#vim#search_history(0)<CR>
nnoremap <silent> [fzf]' :call fzf#vim#marks(0)<CR>
"===== /fzf =====

"===== yankround =====
nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
"===== /yankround =====

"===== lsp =====
let g:LanguageClient_serverCommands = {
            \ 'vue': ['vls'],
            \ 'typescript': ['typescript-language-server', '--stdio'],
            \ 'javascript': ['javascript-typescript-stdio'],
            \ }
let g:LanguageClient_rootMarkers = {
    \ 'vue': ['package.json'],
    \ }
nnoremap <silent> gK :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gD :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gN :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> gR :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> gS :call LanguageClient#textDocument_documentSymbol()<CR>
nnoremap <silent> g* :call LanguageClient#textDocument_documentHighlight()<CR>
nnoremap <silent> g= :call LanguageClient#textDocument_formatting()<CR>
vnoremap <silent> g= :call LanguageClient#textDocument_rangeFormatting()<CR>

"===== /lsp =====

"===== vaffle =====
augroup MyVaffleSetting
  autocmd!
  autocmd FileType vaffle nmap <buffer> l <Plug>(vaffle-open-selected)
  autocmd FileType vaffle nmap <buffer> <CR> <Plug>(vaffle-open-selected)
augroup END
"===== /vaffle =====

"===== memolist =====
let g:memolist_memo_suffix = "uiki"
nnoremap [memolist] <Nop>
nmap ,m [memolist]
nnoremap <silent> [memolist]n :<C-u>MemoNew<CR>
nnoremap <silent> [memolist]m :<C-u>CtrlPMemoList<CR>
"===== /memolist =====

"===== vim-asterisk =====
map * <Plug>(asterisk-z*)
map # <Plug>(asterisk-z#)
let g:asterisk#keeppos = 1
"===== /vim-asterisk =====

"===== previm =====
let g:previm_enable_realtime = 0
let g:previm_show_header = 0
" let g:previm_custom_css_path = '~/Desktop/mine.css'
augroup PrevimSettings
  autocmd!
  autocmd FileType uiki set filetype=markdown | set filetype=uiki.markdown
augroup END
"===== /previm =====

"===== sandwitch =====
nnoremap s <Nop>
nnoremap sa <Nop>
nmap s <Plug>(operator-sandwich-add)
nmap sa <Plug>(operator-sandwich-add)a
xmap s <Plug>(operator-sandwich-add)
xmap sa <Plug>(operator-sandwich-add)a
"===== /sandwitch =====

"===== indent guidline =====
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'showtime']
augroup vimrc-indent-guides
  autocmd!
  " autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
  " autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=black
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235
augroup END
"===== /indent guidline =====

"===== vim-markdown =====
let g:vim_markdown_folding_disabled=1
"===== /vim-markdown =====

"===== quick-hl =====
let g:quickhl_manual_enable_at_startup = 1
noremap [quickhl] <Nop>
map ,q [quickhl]
nmap [quickhl]* <Plug>(quickhl-manual-this)
xmap [quickhl]* <Plug>(quickhl-manual-this)
nmap [quickhl]# <Plug>(quickhl-manual-this)
xmap [quickhl]# <Plug>(quickhl-manual-this)
"===== /quick-hl =====

"===== zen-space =====
augroup vimrc-zenspace
  autocmd!
  autocmd ColorScheme * highlight ZenSpace cterm=undercurl ctermbg=NONE ctermfg=60 gui=undercurl guibg=NONE guifg=#5F5F87
augroup END
"===== zen-space =====

"===== ale =====
" Plugin configuration like the code written in vimrc.
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tslint'],
\   'css': ['stylelint'],
\   'vue': ['tslint'],
\}
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:ale_maximum_file_size = 500000
" let g:ale_sign_column_always = 1
set signcolumn=yes
let g:ale_echo_msg_format = '[%linter%] %s'

let s:ale_running = 0
augroup ALEProgress
    autocmd!
    autocmd User ALELintPre let s:ale_running = 1 | call lightline#update()
    autocmd User ALELintPost let s:ale_running = 0 | call lightline#update()
augroup end
"===== /ale =====

"===== lightline =====
let g:lightline = {
  \'active': {
  \  'left': [
  \    ['mode', 'paste'],
  \    ['readonly', 'filename', 'modified'],
  \    ['aleprogress', 'aleok', 'aleerror'],
  \  ]
  \},
  \'component_function': {
  \  'aleprogress': 'ALEProgress',
  \  'aleok': 'ALEOk'
  \},
  \'component_expand': {
  \  'aleerror': 'ALEError'
  \},
  \'component_type': {
  \  'aleerror': 'error'
  \},
  \'colorscheme': 'default'
\ }

function! ALEProgress()
  return s:ale_running ? '...' : ''
endfunction

function! ALEOk()
  let l:count = ale#statusline#Count(bufnr(''))
  let l:status = l:count.total == 0 ? 'OK' : ''
  return s:ale_running ? '' : l:status
endfunction

function! ALEError()
  let l:count = ale#statusline#Count(bufnr(''))
  let l:errors = l:count.error + l:count.style_error
  let l:warnings = l:count.warning + l:count.style_warning
  let l:status = l:count.total == 0 ? '' : 'E:' . l:errors . ' W:' . l:warnings
  return s:ale_running ? '' : l:status
endfunction

"===== /lightline =====

"===== deoplete =====
let g:deoplete#enable_at_startup = 1
"===== /deoplete =====
"
""""""""""""""""""""""""""""""
" submode
""""""""""""""""""""""""""""""
let g:submode_keep_leaving_key = 1
" タブ移動
call submode#enter_with('changetab', 'n', '', 'gt', 'gt')
call submode#enter_with('changetab', 'n', '', 'gT', 'gT')
call submode#map('changetab', 'n', '', 't', 'gt')
call submode#map('changetab', 'n', '', '<tab>', 'gt')
call submode#map('changetab', 'n', '', 'T', 'gT')
call submode#map('changetab', 'n', '', '<S-tab>', 'gT')
" バッファ移動
call submode#enter_with('changebuf', 'n', '', 'gb', ':<C-u>bn<CR>')
call submode#enter_with('changebuf', 'n', '', 'gB', ':<C-u>bp<CR>')
call submode#map('changebuf', 'n', '', 'b', ':<C-u>bn<CR>')
call submode#map('changebuf', 'n', '', 'B', ':<C-u>bp<CR>')
" ウィンドウサイズ変更
call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>-')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>+')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>-')
call submode#map('winsize', 'n', '', '-', '<C-w>+')
call submode#enter_with('zoom', 'n', 'r', '[zoom]')
call submode#map('zoom', 'n', 'r', '+', '<Plug>(my_zoom_in)')
call submode#map('zoom', 'n', 'r', '-', '<Plug>(my_zoom_out)')
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" superleader
""""""""""""""""""""""""""""""
" superleader
map <Space> [superleader]
map [superleader] [fzf]
map [superleader]<Space> [fzf]b
nmap [superleader]a [fzf]a
nmap [superleader]b [fzf]b
nmap [superleader]c [ctrlp]x
nmap [superleader]f [fzf]f
nmap [superleader]g [fzf]g
nmap [superleader]h [fzf]h
nmap [superleader]m [fzf]m
" nmap [superleader]m [ctrlp]m
nmap [superleader]n [memolist]
nmap [superleader]s [terminal]s
nmap [superleader]t [terminal]t
nmap [superleader]: q:
nmap [superleader]w <C-w>
nmap [superleader]* [quickhl]*
xmap [superleader]* [quickhl]*
nmap [superleader]# [quickhl]#
xmap [superleader]# [quickhl]#
""""""""""""""""""""""""""""""
