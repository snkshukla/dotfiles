set t_Co=256                  "enable 256 colors
colorscheme Dev_Delight

" Stuff related to vim-plug

call plug#begin('~/.vim/plugged')

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
"Plug 'mileszs/ack.vim'
Plug 'tpope/vim-rails'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

call plug#end()

" use Ag, the silver searcher with ack.vim 
let g:ackprg = 'ag --nogroup --nocolor --column'

" Settings

set clipboard=unnamed           "To enable copy paste in vim
syntax enable                   "Turn on syntax highlighting
set number	                    "set the line number
set backspace=indent,eol,start  "Backspace over everything
set mouse=a                     "enabling mouse suppport
set wildmode=longest,list,full  "bash-like tab completion.
set wildmenu                    "first tab completes, second provides a list, third cycles through the options

" filetype settings
filetype on                     "Enable filetype detection
filetype indent on              "Enable filetype-specific indenting
filetype plugin on              "Enable filetype-specific plugins
autocmd FileType yaml setl indentkeys-=<:>

" Tab spacing related settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab                   "Replace tabs with spaces

set cursorline                  "Highlight current line
set hidden                      "Reuse Window for multiple buffers

set smartindent
set autoindent

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


" Highlight trailing spaces.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
" match                         "Disable above highlighting

" The Silver Searcher
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Enabling ruby extensions

set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

set laststatus=2                "Show the status line all the time
set showcmd                     "Display incomplete commands.
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Key mappings

map <C-n> :NERDTreeToggle<CR>
nnoremap .. :FZF<CR>
nnoremap <silent> <Leader>b :TagbarToggle<CR>

" bind \ (backward slash) to grep shortcut
" command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>
