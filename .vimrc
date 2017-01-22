if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.vim/dein'))
  call dein#begin(expand('~/.vim/dein'))

  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('scrooloose/nerdtree')
	call dein#add('ctrlpvim/ctrlp.vim')
	call dein#add('mileszs/ack.vim')
	call dein#add('rking/ag.vim')
	call dein#add('airblade/vim-gitgutter')
	call dein#add('scrooloose/syntastic')
	call dein#add('Shougo/vimproc.vim', {'build': 'make'})
	call dein#add('Shougo/unite.vim')
	call dein#add('Shougo/neomru.vim')

	call dein#end()
  call dein#save_state()
endif


"autocmd: 指定したイベントが発生したときに自動的に実行するコマンドを指定
"VimEnter: vimの全ての起動処理が終わった後に発生するイベント
" ペーストモードからノーマルモードに戻る時に自動で解除
autocmd InsertLeave * set nopaste

" 行番号を表示
set number

"検索結果をハイライトで表示
set hlsearch

"タブ文字の表示幅
set tabstop=2

"入力中のコマンドを表示
set showcmd

"改行時に前の行のインデントを継続する
set autoindent

"自動インデントでずれる幅
set shiftwidth=2

"backspaceの設定
set backspace=indent,eol,start

"クリップボードからのペーストを可能にする
set paste

"ack.vimからagを利用
let g:ackprg = 'ag --nogroup --nocolor --column'

"構文エラー行に「>>」を表示
let g:syntastic_enable_signs = 1

"他のVimプラグインと競合を防止
let g:syntastic_always_populate_loc_list = 1

"構文エラーリストを非表示
let g:syntastic_auto_loc_list = 0

"ファイルを開いた時に構文エラーチェックを実行
let g:syntastic_check_on_open = 1

"ファイルタイプを指定
let g:syntastic_mode_map = { 'mode': 'passive',
												\ 'active_filetypes': ['ruby', 'javascript'] }

"ツールの指定
let g:syntastic_ruby_checkers = ['rubocop']

"挿入モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-a> <HOME>
inoremap <C-e> <END>
inoremap <C-v> <BS>

"NERDTreeでのタブの移動
nnoremap <C-n> gt

filetype plugin indent on
syntax enable
