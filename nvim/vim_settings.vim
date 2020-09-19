" Settings
set hidden
filetype plugin indent on							                                          "Enable plugins and indents by filetype
set termguicolors
set title                       						                                    "change the terminal's title
set clipboard=unnamed           						                                    "To enable copy paste in vim
syntax enable                   						                                    "Turn on syntax highlighting
set number	                						                                        "set the line number
set backspace=indent,eol,start  						                                    "Backspace over everything
set mouse=a                     						                                    "enabling mouse suppport
set wildmode=longest,list,full  						                                    "bash-like tab completion.
set wildmenu                    						                                    "first tab completes, second provides a list, third cycles through the options

"relative line numbers start
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
" relative line number end

autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript   " typescript formatting with prettier

set wrap
set linebreak                                                                   "Wrap lines at convenient points
set listchars=tab:\ \ ,trail:·                                                  "Set trails for tabs and spaces
set list                                                                        "Enable listchars
set inccommand=split                                                            "Show substitute changes immidiately in separate split
set fillchars+=vert:\│                                                          "Make vertical split separator full line
set history=500									                                                "show lots of cmd line history
set gcr=a:blinkon500-blinkwait500-blinkoff500 					                        "set cursor blinking rate
set cursorline
set smartcase                                                                   "Smart case search if there is uppercase
set ignorecase                                                                  "case insensitive search
set showmatch                                                                   "Highlight matching bracket
set splitright                                                                  "Set up new vertical splits positions
set splitbelow                                                                  "Set up new horizontal splits positions
set path+=**                                                                    "Allow recursive search
set pumheight=30                                                                "Maximum number of entries in autocomplete popup
set ttimeoutlen=0                                                               "Reduce Command timeout for faster escape and O
set fileencoding=utf-8                                                          "Set utf-8 encoding on write
set hlsearch
set updatetime=0
:set tags^=./.git/tags

" Highlight trailing spaces.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" ================ Turn Off Swap Files ============== {{{
set noswapfile
set nobackup
set nowb
" }}}

" ================ Indentation ====================== {{{
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set smartindent
set nofoldenable
set colorcolumn=80
" }}}

" ================ Scrolling ======================== {{{
set scrolloff=8                                                                 "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=5
" }}}
"
au BufNewFile,BufRead *.tpl :set filetype=php
