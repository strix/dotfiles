set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set number

call plug#begin('~/.vim/plugged')
    Plug 'dikiaap/minimalist'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'vim-scripts/xptemplate'
    Plug 'severin-lemaignan/vim-minimap'
    Plug 'posva/vim-vue'
    Plug 'mileszs/ack.vim'
    Plug 'elixir-lang/vim-elixir'
    Plug 'Raimondi/delimitMate'
    Plug 'tpope/vim-surround'
    Plug 'pangloss/vim-javascript'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'mattn/emmet-vim'
call plug#end()

colo minimalist
set guifont=Monospace\ Regular\ 13
set guioptions-=T

" tree view file explorer settings
let g:netrw_banner = 0
let g:netrw_browse_split = 3
let g:netrw_liststyle = 3
let g:netrw_winsize = 25
map <C-k> :Vex<CR>

" CTRL-Tab is next tab
noremap <C-Tab> :<C-U>tabnext<CR>
inoremap <C-Tab> <C-\><C-N>:tabnext<CR>
cnoremap <C-Tab> <C-C>:tabnext<CR>
" CTRL-SHIFT-Tab is previous tab
noremap <C-S-Tab> :<C-U>tabprevious<CR>
inoremap <C-S-Tab> <C-\><C-N>:tabprevious<CR>
cnoremap <C-S-Tab> <C-C>:tabprevious<CR>

" ctrlp settings
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = '/node_modules'

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  nmap <C-f> :Ack<space>
endif
