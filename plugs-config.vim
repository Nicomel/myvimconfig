
if has("termguicolors")
   " set t_8f=[38;2;%lu;%lu;%lum
   " set t_8b=[48;2;%lu;%lu;%lum
   " set &t_8f="\e[38;2;%lu;%lu;%lum"
   " set &t_8b="\e[48;2;%lu;%lu;%lum"
endif
syntax on
set termguicolors
" ------------- Onedark colorscheme ---------------
" Make `Function`s bold in GUI mode
" autocmd ColorScheme * call onedark#extend_highlight("Function", { "gui": "bold" })
" let g:onedark_terminal_italics = 1
" colorscheme onedark
" ------------- Tokyonight colorscheme ---------------
let g:tokyonight_style = "night"
colorscheme tokyonight

"set background=dark
" hi Normal guibg=NONE
" To enable italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic
let g:colorizer_auto_filetype='css,scss,sass,html,tsx,jsx'
" Floating window style (LSP)
" highlight NormalFloat guibg=NONE
" highlight FloatBorder guifg=#61AFEF guibg=NONE
highlight LineNr guibg=#1B1F27
" Completion meny style
set pumblend=15
hi PmenuSel blend=0

" nvim-tree config
nnoremap <Leader>ee :NvimTreeToggle<CR>
nnoremap <leader>ef :NvimTreeFindFile<CR>
nnoremap <leader>er :NvimTreeRefresh<CR>
nnoremap <leader>es :NvimTreeResize 50<CR>
" NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them


" Fugitive
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gc :Git commit -v -q<CR>
nnoremap <leader>ga :Git commit --amend<CR>
nnoremap <leader>gt :Git commit -v -q %<CR>
nnoremap <leader>gd :Gvdiffsplit!<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gl :Gclog<CR>
nnoremap <leader>g0 :0Gclog<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :GMove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gx :only<CR>
nnoremap <leader>g2 :diffget //2<Space>
nnoremap <leader>g3 :diffget //3<Space>

" FZF map
nnoremap <silent> <Leader>zf :Files<CR>
nnoremap <silent> <Leader>zs :Rg <C-r>"<CR>
nnoremap <silent> <Leader>zg :Rg<CR>
nnoremap <silent> <Leader>zb :Buffers<CR>

" Telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fs <cmd>Telescope grep_string<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" IndentLine
" let g:indentLine_char_list = ['▏']
" let g:indentLine_char_list = [' ']
" let g:indentLine_bgcolor_gui = '#333842'

" Conceallevel to 0 for JSON and md file (due to IndentLine changing the level)
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" SymbolsOutline
nnoremap <leader>l :SymbolsOutline<CR>

" Neotest
"Run nearest
nnoremap <silent> <leader>tn :lua require('neotest').run.run()<CR>
"Debug nearest
nnoremap <silent> <leader>tN :lua require('neotest').run.run({strategy = 'dap'})<CR>
"Run file
nnoremap <silent> <leader>tf :lua require('neotest').run.run(vim.fn.expand("%"))<CR>
"Attach
nnoremap <silent> <leader>ta :lua require('neotest').run.attach()<CR>
"Debug file
nnoremap <silent> <leader>tF :lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<CR>
"Run last
nnoremap <silent> <leader>tl :lua require('neotest').run.run_last()<CR>
"Debug last
nnoremap <silent> <leader>tL :lua require('neotest').run.run_last({ strategy = 'dap' })<CR>
"Output
nnoremap <silent> <leader>to :lua require('neotest').output.open({ enter = true })<CR>
"Stop
nnoremap <silent> <leader>tS :lua require('neotest').run.stop()<CR>
"Summary
nnoremap <silent> <leader>ts :lua require('neotest').summary.toggle()<CR>

" Nvim-dap
nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>
