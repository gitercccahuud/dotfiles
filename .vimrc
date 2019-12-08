
set clipboard&
set clipboard^=unnamedplus

"エンコードの設定
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac

" ファイル設定
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" 自動でコメントアウトしない
autocmd FileType * setlocal formatoptions-=ro


" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" 構文ハイライトの有効化
syntax enable
"ビープを鳴らさない
set belloff=all
"メニューバーを非表示
set guioptions-=m
"右スクロールバーを非表示
set guioptions+=R
"yでコピーしたときにクリップボードに
set guioptions+=a
"コメントを読みやすくする
autocmd ColorScheme * highlight Comment ctermfg=3
"タブの設定
set tabstop=4
set expandtab
set shiftwidth=4
"インデントラインの可視化
let g:indentLine_char = '|'

" バックスペースの設定
set backspace=indent,eol,start

"検索系
"検索文字が小文字のとき大文字小文字を区別しない
set ignorecase
"検索文字が大文字のときは区別する
set smartcase
"同期的な検索をする
set incsearch
"ファイルの最後まで検索したらファイルの先頭に戻る
set wrapscan
"検索語をハイライトする
set hlsearch
"ESCキー連打でハイライトを解除
nmap<Esc><Esc> :nohlsearch<CR><Esc>

"vim-clangの設定
"let g:clang_format_auto = 1

"colorscheme
syntax on
colorscheme molokai
set t_Co=256

"skk-vimの設定 
let g:skk_large_jisyo = '~/.skk-dic/SKK-JISYOutf-8.L'
let  g:skk_egg_like_newline=1
let g:skk_maker_white='>'
let g:skk_maker_black='#'


"autofmtの設定 
set formatexpr=autofmt#japanese#formatexpr()

"最後のカーソル位置を記憶
augroup vimrcEx
    au BufRead * if line("'\'") > 0 && line("'\'") <= line("$") |
                \ exe "normal g`\"" | endif
augroup END


"vim-markdownの設定
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_auto_insert_bullets=0
let g:vim_markdown_new_list_item_indent=0

"kannokanno/previm options
autocmd BufRead,BufNewFile *.md set filetype=markdown
"show previews <C-p>
nnoremap <silent> <C-p> :PrevimOpen<CR>

"tyru/open-browser.vim options
let g:netrw_nogx=1 "disable netrw's gx mapping.
nmap gx <plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

"tweetVim options
"nnoremap <silent>s :<C-u>TweetVimSay<CR>
nnoremap<silent>t :TweetVimHomeTimeline<CR>
nnoremap <silent>tm :tweetVimMentions<CR>

"書いたはいいがgvimじゃないと動かない
let g:tweetvim_display_icon =1
let g:tweetvim_tweet_per_page = 80

set shell=/data/data/com.termux/files/home/usr/bin/bash

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/data/data/com.termux/files/home/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/data/data/com.termux/files/home/.cache/dein')
  call dein#begin('/data/data/com.termux/files/home/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/data/data/com.termux/files/home/.cache/dein/repos/github.com/Shougo/dein.vim')
"  call dein#add('justmao945/vim-clang')
  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
  let g:config_dir = expand('~/.cache/dein/userconfig/')
  let s:toml = g:config_dir . 'plugins.toml'
  let s:lazy_toml = g:config_dir . 'plugins_lazy.toml'

  "read toml
  call dein#load_toml(s:toml, {'lazy':0})
  call dein#load_toml(s:lazy_toml, {'lazy':1})
  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
