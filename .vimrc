if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.vim/dein'))
  call dein#begin(expand('~/.vim/dein'))

  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('mileszs/ack.vim')
  call dein#add('rking/ag.vim')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('Shougo/vimproc.vim', {'build': 'make'})
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('w0rp/ale')
  call dein#add('tpope/vim-surround')
  call dein#add('kana/vim-submode')
  call dein#add('tpope/vim-fugitive')
  call dein#add('soramugi/auto-ctags.vim')
  call dein#add('kchmck/vim-coffee-script')
  call dein#add('fatih/vim-go')
  call dein#add('ekalinin/Dockerfile.vim')
  call dein#end()
  call dein#save_state()
endif


" autocmd: 指定したイベントが発生したときに自動的に実行するコマンドを指定
" VimEnter: vimの全ての起動処理が終わった後に発生するイベント
autocmd VimEnter * execute 'NERDTree'

" ファイル編集中にスワップファイルを作らない
set noswapfile

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
"set statusline+='%{ALEGetStatusLine()}'
"let g:ale_statusline_format = ['E:%d', 'W:%d', 'OK!']

let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_linters = {
\  'javascript': ['eslint'],
\  'ruby': ['ruby', 'rubocop'],
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

"NERDTreeでのタブの移動
nnoremap <C-n> gt

"NERDTreeでバッファの変更を可能にする
set modifiable

" Window Sizeの変更モードを定義
" argv[1]：mode, arg[2]：option, argv[3]：{lhs}, argv[4]: {rhs}
" enter_with: モードに入りバインドキーを実行する
call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>+')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>-')
" map: モードに入った時のキーバインド
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>+')
call submode#map('winsize', 'n', '', '-', '<C-w>-')

" fugitive
nnoremap <silent> gw :<C-u>Gwrite<CR>
nnoremap <silent> gc :<C-u>Gcommit<CR>
nnoremap <silent> gcp :<C-u>Gcommit -p<CR>
nnoremap <silent> gcv :<C-u>Gcommit -v<CR>
nnoremap <silent> gca :<C-u>Gcommit --amend<CR>
nnoremap <silent> gd :<C-u>Gdiff<CR>
nnoremap <silent> gb :<C-u>Gblame<CR>
nnoremap <silent> gps :<C-u>Gpush<CR>
nnoremap <silent> gpl :<C-u>Gpull<CR>
nnoremap <silent> gtig :<C-u>Agit<CR>
nnoremap <silent> gl :<C-u>AgitFile<CR>
nnoremap <silent> gbr :<C-u>Merginal<CR>

" ctags
" tagsファイルの読取場所の指定
set tags+=.git/tags
" <C-]> そのままの画面でタグジャンプ
" <C-t> タグジャンプする前の画面に戻る
" :tjump 該当結果が複数ある場合にリスト表示
" タグジャンプ先が複数ある場合は一覧表示
nnoremap <C-]> g<C-]>
" タグジャンプした時に画面を分割する
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

" auto-ctags
" セーブした時に自動でctagsを実行
" :Ctags でもctagsを実行できる
let g:auto_ctags = 1
" .gitディレクトリにtagsファイルを作成する
let g:auto_ctags_directory_list = ['.git']
" ctagsのオプション指定
let g:auto_ctags_tags_args = '--recurse=yes --append=yes --tag-relative=yes --languages=Ruby,JavaScript --exclude=node_modules --exclude=vendor --exclude=.git --exclude=log'

" CoffeeScript
augroup filetypedetect
  autocmd! BufNewFile,BufRead *.coffee setfiletype coffee
augroup END

filetype plugin indent on
syntax enable
