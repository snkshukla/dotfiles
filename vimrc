colorscheme jelleybeans
" Stuff related to vim-plug

call plug#begin('~/.vim/plugged')

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
"Plug 'mileszs/ack.vim'
Plug 'tpope/vim-rails'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

call plug#end()

" use Ag, the silver searcher with ack.vim 
let g:ackprg = 'ag --nogroup --nocolor --column'

" Settings
set number	" set the line number
set backspace=indent,eol,start  " Backspace over everything
set mouse=a " enabling mouse suppport

" Remap keys for switching between buffers
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

set ignorecase                  "Case-insensitive searching.
set smartcase                   "But case-sensitive if expression contains a capital letter.
set incsearch                   "Search as you type

"Highlight Search
highlight Search ctermbg=208 ctermfg=Black cterm=NONE
set hlsearch

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab                   " Replace tabs with spaces

" Enabling ruby extensions

set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" Key mappings

map <C-n> :NERDTreeToggle<CR>
nnoremap .. :FZF<CR>
nnoremap <silent> <Leader>b :TagbarToggle<CR>

" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>
