set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab autoindent splitright splitbelow showcmd number
set showbreak=↪
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79
autocmd FileType php setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd BufRead,BufNewFile *.blade.php set filetype=blade
autocmd BufNewFile,BufRead *.apex set filetype=apex
filetype plugin on

" Turn off any error sounds or flashes
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

if has('termguicolors')
  set termguicolors
endif

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set incsearch
set ic
set timeoutlen=1000 ttimeoutlen=0

" copy relative filepath from project root of file
noremap <silent> <F3> :let @+=expand("%")<CR>

" copy root filepath from project root of file
noremap <silent> <F4> :let @+=expand("%:p")<CR>

" change cursor between ibeam for insert and block for normal
if &term == 'xterm-256color' || &term == 'screen-256color'
  let &t_SI = "\<Esc>[5 q"
  let &t_EI = "\<Esc>[1 q"
endif

let &t_ut=''

set clipboard^=unnamed,unnamedplus

" Make vims shell interactive
" set shellcmdflag=-ic

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
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'junegunn/gv.vim'
    Plug 'junegunn/fzf.vim'
    Plug 'vim-scripts/xptemplate'
    Plug 'severin-lemaignan/vim-minimap'
    Plug 'mileszs/ack.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'
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
    Plug 'sheerun/vim-polyglot'
    Plug 'fatih/vim-go'
    Plug 'ejholmes/vim-forcedotcom'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'airblade/vim-rooter'
    Plug 'ap/vim-css-color'
    Plug 'yuttie/comfortable-motion.vim'
    Plug 'mhinz/vim-startify'
    Plug 'wesQ3/vim-windowswap'
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
map <leader>k :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1

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

" window
nmap <leader>swl :topleft  vnew<CR>
nmap <leader>swh :botright vnew<CR>
nmap <leader>swk :topleft  new<CR>
nmap <leader>swj :botright new<CR>
" buffer
nmap <leader>sl :leftabove  vnew<CR>
nmap <leader>sh :rightbelow vnew<CR>
nmap <leader>sk :leftabove  new<CR>
nmap <leader>sj :rightbelow new<CR>

" let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|build|deps|venv*)|(\.(swp|ico|git|svn))$'
nnoremap <C-p> :FZF<Cr>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

if executable('rg')
  let g:ackprg = 'rg --vimgrep'
  nmap <C-f> :Ack<space>
endif

" startify settings
function! s:filter_header(lines) abort
  let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
  let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
  return centered_lines
endfunction
" art generated by `node ~/Desktop/temp/image2ascii.js ~/Pictures/alchemy-owl.jpg`
let g:startify_custom_header = s:filter_header([
      \ ' ........,,.......',
      \ ' .:. .,:::::,,..:.',
      \ ' .,;; .........i,.',
      \ ' :;;fti::i;:;1f1;:.',
      \ ':i;,;ittii;ttii::i:',
      \ ':i;:i111:.,i111:;i:',
      \ ',;;L1i;,.i,.:iit1,;',
      \ ',;.1tti:....;1tt,,;',
      \ ' ;:,;11;, .:11i:,i,',
      \ ' .;::ifi;.:;t1::;,',
      \ '   ;;;11ftft1i;;,',
      \ '  ..:111if1111;..',
      \ '    .;1111111i,',
      \ '      ,;iii;:.',
      \ ])
