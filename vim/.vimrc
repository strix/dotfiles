set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab autoindent splitright splitbelow
autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79
autocmd BufNewFile,BufRead *.apex set filetype=apex
set number

set incsearch
set ic

set clipboard^=unnamed,unnamedplus

" Make vims shell interactive
set shellcmdflag=-ic

" automatically read new file changes
set autoread

set wildmenu
set wildmode=full

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
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'
    Plug 'pangloss/vim-javascript'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'mattn/emmet-vim'
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --js-completer' }
    Plug 'scrooloose/nerdcommenter'
    Plug 'scrooloose/nerdtree'
    Plug 'gcmt/taboo.vim'
    Plug 'joshdick/onedark.vim'
    Plug 'w0rp/ale'
    Plug 'Valloric/MatchTagAlways'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'ejholmes/vim-forcedotcom'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'airblade/vim-rooter'
call plug#end()

let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsSnippetDirectories=['UltiSnips', 'MySnips']
let g:UltiSnipsSnippetsDir='~/.vim/MySnips'
autocmd FileType python UltiSnipsAddFiletypes django

let g:ultisnips_javascript = {
  \ 'keyword-spacing': 'always',
  \ 'semi': 'never',
  \ 'space-before-function-paren': 'always',
\ }

colo onedark

if has('win32')
    set guifont=Consolas:h12   " Win32.
elseif has('gui_macvim')
    set guifont=Menlo\ Regular:h14     " OSX.
else
    set guifont=Monospace\ Regular\ 13 "Linux.
endif

set guioptions-=T
let g:ale_linters = {
\   'javascript': ['standard'],
\   'python': ['pycodestyle'],
\}
set guioptions-=m
set guioptions-=r
set guioptions-=L

set updatetime=250

let g:taboo_tab_format = " %N - %f%m "
map <C-k> :NERDTreeToggle<CR>

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

let g:NERDCustomDelimiters = {
  \ 'python': { 'left': '#', 'right': '' }
\}

let g:rooter_change_directory_for_non_project_files = 'home'
let g:rooter_use_lcd = 1
let g:rooter_resolve_links = 1
let g:rooter_patterns = ['package.json', '.git/']

" CTRL-T is new tab
noremap <C-T> :<C-U>tabnew<CR>
inoremap <C-T> <C-\><C-N>:tabnew<CR>
cnoremap <C-T> <C-C>:tabnew<CR>
" CTRL-Tab is next tab
noremap <C-Tab> :<C-U>tabnext<CR>
inoremap <C-Tab> <C-\><C-N>:tabnext<CR>
cnoremap <C-Tab> <C-C>:tabnext<CR>
" CTRL-SHIFT-Tab is previous tab
noremap <C-S-Tab> :<C-U>tabprevious<CR>
inoremap <C-S-Tab> <C-\><C-N>:tabprevious<CR>
cnoremap <C-S-Tab> <C-C>:tabprevious<CR>

nnoremap <leader>lcd :lcd %:p:h<CR>:pwd<CR>
" Select text that was last pasted
nnoremap gp `[v`]

" ctrlp settings
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|build|deps)|(\.(swp|ico|git|svn))$'

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  nmap <C-f> :Ack<space>
endif
