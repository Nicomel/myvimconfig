
if has("termguicolors")
   " set t_8f=[38;2;%lu;%lu;%lum
   " set t_8b=[48;2;%lu;%lu;%lum
   " set &t_8f="\e[38;2;%lu;%lu;%lum"
   " set &t_8b="\e[48;2;%lu;%lu;%lum"
   set termguicolors
endif
" Make `Function`s bold in GUI mode
autocmd ColorScheme * call onedark#extend_highlight("Function", { "gui": "bold" })
syntax on
let g:onedark_terminal_italics = 1
colorscheme onedark
"set background=dark
" To enable italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic
let g:colorizer_auto_filetype='css,scss,sass,html,tsx,jsx'
" Floating window style (LSP)
highlight NormalFloat guibg=NONE
" highlight NormalFloat guibg=#32363E
highlight FloatBorder guifg=#61AFEF guibg=NONE
" highlight LineNr guibg=#2D3139
highlight LineNr guibg=#1B1F27
" Completion meny style
set pumblend=15
hi PmenuSel blend=0
" Background colors for active vs inactive windows
hi ActiveWindow guibg=NONE
hi InactiveWindow guibg=#30343C
" Call method on window enter
augroup WindowManagement
  autocmd!
  autocmd WinEnter * call Handle_Win_Enter()
augroup END

" Change highlight group of active/inactive windows
function! Handle_Win_Enter()
  setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
endfunction

" air-line
set laststatus=2
let g:airline_theme = 'onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
" let g:airline_left_sep = ''
let g:airline_left_sep = "\uE0B4"
" let g:airline_left_alt_sep = ''
let g:airline_left_alt_sep = "\uE0B5"
" let g:airline_right_sep = ''
let g:airline_right_sep = "\uE0B6"
" let g:airline_right_alt_sep = ''
let g:airline_right_alt_sep = "\uE0B7"
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" NERDTree
nnoremap <Leader>t :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>d :NERDTreeFind<CR>
autocmd StdinReadPre * let s:std_in=1
" Start NERDTree when Vim is started without file arguments
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif
" Start NERDTree when Vim starts with a directory argument
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
" Automatically close a tab if the only remaining window is NerdTree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
let g:NERDTreeGitStatusGitBinPath = '/usr/local/bin/git'
let g:NERDTreeGitStatusShowClean = 1
let g:NERDTreeGitStatusConcealBrackets = 1

" FZF map
nnoremap <silent> <Leader>o :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>g :Rg<CR>

" ALE
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰']

" IndentLine
" let g:indentLine_char_list = ['▏']
let g:indentLine_char_list = [' ']
let g:indentLine_bgcolor_gui = '#333842'

" Conceallevel to 0 for JSON and md file (due to IndentLine changing the level)
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" nvim-compe
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm({ 'keys': "\<Plug>delimitMateCR", 'mode': '' })
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
autocmd FileType typescriptreact UltiSnipsAddFiletypes typescript.typescriptreact.html
