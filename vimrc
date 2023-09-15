set number
set fileencoding=utf-8
set cursorline
set hlsearch
set incsearch "nohlsearchでハイライトが消せる
set laststatus=2
set wildmenu "ステータスラインに補完候補を表示する
set clipboard+=unnamed "クリップボードとやんく、プットが連携される


"キーマップ
let g:mapleader = "\<Space>"
"jjをescの代わりとして使用
inoremap <silent> jj <ESC>
"shift+h で行の先頭に移動
noremap <S-h> 0
"shift+l で行の末尾に移動
noremap <S-l> $ 
"Leaderキー（今はスペースキー）+ . で.vimrcを開く
nnoremap <Leader>. :new ~/.vimrc<CR>
nnoremap <C-w> :quit<CR>
nnoremap <C-h> :tabprev<CR>
nnoremap <C-l> :tabnext<CR>
" ヤンクでクリップボードに貼り付ける → vscodeの場合はsettings.jsonで設定 → "vim.usesystemclipboard": true, 
nnoremap <CR> i<Return><Esc>^k


"カーソルの形状設定
if has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif

"markdownでアンダースコアをハイライトしない
augroup update_markdown_syntax
  autocmd!
  autocmd BufNew,BufEnter * if &filetype == 'markdown' | syntax match markdownError '\w\@<=\w\@=' | endif
augroup END

