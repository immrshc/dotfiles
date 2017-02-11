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
  call dein#add('Shougo/vimproc.vim', {'build': 'make'})
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('w0rp/ale')

  call dein#end()
  call dein#save_state()
endif


"autocmd: 指定したイベントが発生したときに自動的に実行するコマンドを指定
"VimEnter: vimの全ての起動処理が終わった後に発生するイベント
autocmd VimEnter * execute 'NERDTree'

" ペーストモードからノーマルモードに戻る時に自動で解除
autocmd InsertLeave * set nopaste

" 行番号を表示
set number

"検索結果をハイライトで表示
set hlsearch

"ファイル内にあるタブ文字の表示幅
set tabstop=2

"自動インデントに使われる空白の数
set shiftwidth=2

"連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=2

"タブを可視化する
set list

"tab: タブ文字を表示
"trail：行末のスペースを表示
"nbsp：ノーブレークスペースを表示
"eol：改行を表示
set listchars=tab:__,trail:-,nbsp:%

"タブ文字ではなく、半角スペースを挿入
set expandtab

"入力中のコマンドを表示
set showcmd

"改行時に前の行のインデントを継続する
set autoindent

"自動インデントでずれる幅
set shiftwidth=2

"backspaceの設定
set backspace=indent,eol,start

"ack.vimからagを利用
let g:ackprg = 'ag --nogroup --nocolor --column'

"ale
set statusline+='%{ALEGetStatusLine()}'
let g:ale_statusline_format = ['E:%d', 'W:%d', 'OK!']

let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_linters = {
\  'javascript': ['flow'],
\  'ruby': ['rubocop'],
\}

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

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
