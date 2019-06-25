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

" Remap keys for switching between buffers
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

map <C-n> :NERDTreeToggle<CR>
nnoremap rin :NERDTree %<CR>

nnoremap .. :FZF<CR>
nnoremap ,, :Ag<CR>
nnoremap ,c :cclose<CR>
nnoremap ,w :w<CR>

" bind cp command to copy the path of the current file
nnoremap cp :let @+ = expand("%")<CR>

" use <Option-o> and <Option-O> to insert new lines in insert mode
imap ø <Esc>o
imap Ø <Esc>O

"bind <ESC><ESC> to close the terminal window
" tnoremap <ESC><ESC> <C-\><C-n>
