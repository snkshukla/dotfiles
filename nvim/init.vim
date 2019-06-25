" set t_Co=256                  "enable 256 colors
set hidden

"install vim-plug if not installed already
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent execute "!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall | source '~/.config/nvim/init.vim'
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'                                                        "needed by fugitive to browse the file on github/remote
Plug 'tpope/vim-abolish'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chrisbra/csv.vim'
Plug 'thaerkh/vim-workspace'
Plug 'Yggdroot/indentLine'
Plug 'avakhov/vim-yaml'
Plug 'terryma/vim-smooth-scroll'
Plug 'neomake/neomake'
Plug 'Raimondi/delimitMate'
Plug 'duff/vim-bufonly'
Plug 'airblade/vim-gitgutter'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'thoughtbot/vim-rspec'
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }

"Automatic creation of ctags upon opening of a project
Plug 'ludovicchabant/vim-gutentags'

" Changes for javascript
" ================ Turn Off Swap Files ============== {{{

Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'alvan/vim-closetag'

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

Plug 'vim-scripts/AnsiEsc.vim'

Plug 'skywind3000/asyncrun.vim'

" }}}
"
" Plug 'gabrielelana/vim-markdown'
" Plug 'bronson/vim-visual-star-search'
" Plug 'moll/vim-node'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'               "Always load this in last

call plug#end()

let g:indentLine_setColors = 0
let g:indentLine_char = '┆'
"sql completion turn off
let g:loaded_sql_completion = 0
let g:omni_sql_no_default_maps = 1

"Vim rspec settings
let g:rspec_command = "AsyncRun bin/rspec {spec}"
"Deoplete and ternjs settings

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])

let g:deoplete#sources#tss#javascript_support = 1
let g:neomake_javascript_enabled_makers = ['eslint']
let g:asyncrun_open = 8

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.jsx"
autocmd BufWritePost *.js AsyncRun -post=checktime eslint --fix %

" for vim neomake
call neomake#configure#automake('rw', 1000)
" color janah
colorscheme hybrid_material
set background=dark                                                             "Set background to dark
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.

" use <Option-o> and <Option-O> to insert new lines in insert mode
imap ø <Esc>o
imap Ø <Esc>O

" use Ag, the silver searcher with ack.vim
" let g:ackprg = 'ag --nogroup --nocolor --column'


let g:mapleader = ","           						                                    "Change leader to a comma

let g:enable_bold_font = 1      						                                    "Enable bold font in colorscheme
let g:enable_italic_font = 1    						                                    "Enable italic font in colorscheme

" DelimitMate settings
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 2
" let g:airline_theme = 'hybrid'
" "set the theme for alirline
" Settings
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

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" we are using auto cmd group because if the same autocmd has been
" defined twice in vimrc, vim will not replace the earlier one, it
" will keep both. So auto cmd groups will remove this possibility.
" The first command 'autocmd!' clears everything in the group.

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
" relative line number end

set wrap
set linebreak                                                                   "Wrap lines at convenient points
set listchars=tab:\ \ ,trail:·                                                  "Set trails for tabs and spaces
set list                                                                        "Enable listchars
" set lazyredraw                                                                  "Do not redraw on registers and macros
" set conceallevel=2 concealcursor=i                                              "neosnippets conceal marker
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

"Highlight Search
" highlight Search ctermbg=208 ctermfg=Black cterm=NONE
set hlsearch

set updatetime=0

" Highlight trailing spaces.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" https://github.com/thaerkh/vim-workspace/issues/9 disabling trimming of
" whitespaces
" let g:workspace_autosave_untrailspaces = 0
" match                         "Disable above highlighting


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
" ================ Abbreviations ==================== {{{

cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev Bd bd
cnoreabbrev bD bd
cnoreabbrev wrap set wrap
cnoreabbrev nowrap set nowrap
cnoreabbrev bda BufOnly
cnoreabbrev f find
cnoreabbrev F find

" }}}

" Remap keys for switching between buffers
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

map <C-n> :NERDTreeToggle<CR>
nnoremap rin :NERDTree %<CR>

nnoremap .. :FZF<CR>
nnoremap ,, :Ag<CR>

" bind cp command to copy the path of the current file
nnoremap cp :let @+ = expand("%")<CR>

"bind <ESC><ESC> to close the terminal window
" tnoremap <ESC><ESC> <C-\><C-n>

" Airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamenod = ':t'
let g:airline_powerline_fonts = 1

let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

"enabling displaying index of the buffer.
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <S-Tab> <Plug>AirlineSelectPrevTab
nmap <Tab> <Plug>AirlineSelectNextTab
nmap <leader>d :bd\|bd #<CR>
nmap <leader>s :Buffers<CR>

"mappings for vim-go
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
