let g:indentLine_setColors = 0
let g:indentLine_char = '┆'
let g:loaded_sql_completion = 0   "sql completion turn off
let g:omni_sql_no_default_maps = 1  "sql completion turn off
let g:rspec_command = "AsyncRun bin/rspec {spec}" "Vim rspec settings
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

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories = ["/Users/shubham/dotfiles/Ultisnips/"]

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.jsx"
autocmd BufWritePost *.js AsyncRun -post=checktime eslint --fix %

call neomake#configure#automake('rw', 1000) " for vim neomake
let g:mapleader = ","           						                                    "Change leader to a comma
let g:enable_bold_font = 1      						                                    "Enable bold font in colorscheme
let g:enable_italic_font = 1    						                                    "Enable italic font in colorscheme

" DelimitMate settings
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 2

" https://github.com/thaerkh/vim-workspace/issues/9 disabling trimming of
" whitespaces
" let g:workspace_autosave_untrailspaces = 0
" match                         "Disable above highlighting

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamenod = ':t'
let g:airline_powerline_fonts = 1

let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

"enabling displaying index of the buffer.
let g:airline#extensions#tabline#buffer_idx_mode = 1

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
