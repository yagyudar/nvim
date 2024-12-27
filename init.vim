" vim:set ts=8 sts=2 sw=2 tw=0:

" プラグインと関係ない設定
if 1 && filereadable($HOME . '/.config/nvim/base.vim')
  source $HOME/.config/nvim/base.vim
endif

""dein Scripts-----------------------------
if &compatible
  set nocompatible
endif

set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state($HOME . '/.cache/dein')
  call dein#begin($HOME . '/.cache/dein')

  let s:toml = $HOME . '/.config/nvim/dein-plugins.toml'
  call dein#load_toml(s:toml, {'lazy': 0})

  call dein#end()
  call dein#save_state()

  call dein#recache_runtimepath()
endif

" Required:
filetype plugin indent on
syntax enable
" "End dein Scripts-------------------------

" プラグイン設定
if 1 && filereadable($HOME . '/.config/nvim/plugin.vim')
  source $HOME/.config/nvim/plugin.vim
endif

" (最後に読み込む) サイトローカルな設定local.vimrc
" (このファイルはホームディレクトリに各環境で配置する)
if 1 && filereadable($HOME . '/.config/nvim/local.vim')
  source $HOME/.config/nvim/local.vim
endif
