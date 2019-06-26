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
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'alvan/vim-closetag'
Plug 'Shougo/deoplete.nvim' ", { 'do': function('DoRemote') }
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'SirVer/ultisnips'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'               "Always load this in last

call plug#end()
