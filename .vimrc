"エンコードの設定
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac

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
"ファイルのカーソルがあった場所を記憶する
augroup vimrcEx
    au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
                \ exe "normal g`\"" | endif
augroup END


" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" インデントはスマートインデント
set smartindent
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" シンタックスハイライトの有効化
syntax enable
"ビープを鳴らさない
set belloff=all
"メニューバーを非表示
set guioptions-=m
"右スクロールバーを非表示
set guioptions+=R
"yでコピーしたときにクリップボードに
set guioptions+=a


"移動・操作系
" 自動でコメントアウトしない
autocmd FileType * setlocal formatoptions-=ro
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore



"カラースキーム
"コメントを読みやすく
autocmd ColorScheme * highlight Comment ctermfg=220
"autocmd ColorScheme * highlight Statement ctermfg=160

syntax on
colorscheme molokai
set t_Co=256
"スクロールで色が変わるのを無向
if &term =~ '256color'
    set t_ut=
endif


" Tab系
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>


"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/gitercccahuud/.vim/dein/repos/github.com/Shougo/dein.vim


" Required:
if dein#load_state('/home/gitercccahuud/.vim/dein/')
  call dein#begin('/home/gitercccahuud/.vim/dein/')


	let g:config_dir = expand('~/.vim/dein/userconfig/')
	let s:toml = g:config_dir . 'plugins.toml'
	let s:lazy_toml = g:config_dir . 'plugins_lazy.toml'

  " Let dein manage dein
  " Required:
  "call dein#add('/c/Users/USER/.vim/dein//repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
 " call dein#add('Shougo/neosnippet.vim')
 " call dein#add('Shougo/neosnippet-snippets')
	"read toml
	call dein#load_toml(s:toml,{'lazy':0})
	call dein#load_toml(s:lazy_toml,{'lazy':1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
synta enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

