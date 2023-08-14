let g:loaded_perl_provider = 0
let g:python3_host_prog = '/usr/local/bin/python3'
let g:indentLine_setColors = 0
let g:indentLine_char = '┆'
let g:loaded_sql_completion = 0   "sql completion turn off
let g:omni_sql_no_default_maps = 1  "sql completion turn off
let g:rspec_command = "AsyncRun bin/rspec {spec}" "Vim rspec settings
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

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamenod = ':t'
let g:airline_powerline_fonts = 1

"enabling displaying index of the buffer.
let g:airline#extensions#tabline#buffer_idx_mode = 1

"vim-terraform settings
let g:terraform_align = 1
let g:terraform_fmt_on_save = 1
let g:terraform_fold_sections = 1

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

" =============================== Settings for ddc plugin==========
" Customize global settings

" You must set the default ui.
" NOTE: native ui
" https://github.com/Shougo/ddc-ui-native
call ddc#custom#patch_global('ui', 'native')

" Use around source.
" https://github.com/Shougo/ddc-source-around
call ddc#custom#patch_global('sources', ['around'])

" Use matcher_head and sorter_rank.
" https://github.com/Shougo/ddc-matcher_head
" https://github.com/Shougo/ddc-sorter_rank
call ddc#custom#patch_global('sourceOptions', #{
      \ _: #{
      \   matchers: ['matcher_head'],
      \   sorters: ['sorter_rank']},
      \ })

" Change source options
call ddc#custom#patch_global('sourceOptions', #{
      \   around: #{ mark: 'A' },
      \ })
call ddc#custom#patch_global('sourceParams', #{
      \   around: #{ maxSize: 500 },
      \ })

" Customize settings on a filetype
call ddc#custom#patch_filetype(['c', 'cpp'], 'sources',
      \ ['around', 'clangd'])
call ddc#custom#patch_filetype(['c', 'cpp'], 'sourceOptions', #{
      \   clangd: #{ mark: 'C' },
      \ })
call ddc#custom#patch_filetype('markdown', 'sourceParams', #{
      \   around: #{ maxSize: 100 },
      \ })

" Mappings

" <TAB>: completion.
inoremap <silent><expr> <TAB>
\ pumvisible() ? '<C-n>' :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ '<TAB>' : ddc#map#manual_complete()

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? '<C-p>' : '<C-h>'

" Use ddc.
call ddc#enable()
" =============================== Settings for ddc plugin==========
