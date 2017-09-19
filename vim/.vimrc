set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab autoindent
autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79
set number

let mapleader = ","
nmap <C-_> <leader>c<Space>
vmap <C-_> <leader>c<Space>
runtime macros/matchit.vim

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
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
    Plug 'scrooloose/nerdcommenter'
    Plug 'scrooloose/nerdtree'
    Plug 'gcmt/taboo'
call plug#end()

colo minimalist
set guifont=Monospace\ Regular\ 13
set guioptions-=T

let g:taboo_tab_format = " %N - %f%m "
map <C-k> :NERDTreeToggle<CR>

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
