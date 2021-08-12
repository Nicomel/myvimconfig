set nocompatible
filetype off      " required by vundle (see below)

set cursorline
set nowrap        " don't wrap lines

set mouse=a
set autoindent
set number        " Line numbers on
set foldmethod=syntax
set foldlevel=10

set showmatch     " Show matching brackets/parenthesis
set incsearch     " Find as you type search
set hlsearch      " Highlight search terms
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "  case-sensitive otherwise
set nobackup
set nowritebackup
set noswapfile

set hidden

" Remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" lua << EOF
" vim.lsp.set_log_level("debug")
" EOF

" Change cursor style based on the mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

if !exists('g:vscode')
  " Map
  " ---
  let mapleader = ","
  " Quickly edit/reload the vimrc file
  nmap <silent> <leader>ev :e $MYVIMRC<CR>
  nmap <silent> <leader>lv :so $MYVIMRC<CR>
  " Save and quit
  noremap <leader>q :q<cr>
  nnoremap <leader>s :w<cr>
  " Move between buffers
  " nnoremap <leader>w :bdelete<cr>
  nnoremap <leader>w :bprevious<cr>:bdelete #<cr>
  " use ,v to make a new vertical split, ,s for horiz, ,x to close a split
  noremap <leader>v <c-w>v<c-w>l
  noremap <leader>y <c-w>s<c-w>j
  noremap <leader>x <c-w>o
  " use ctrl-h/j/k/l to switch between splits
  map <c-j> <c-w>j
  map <c-k> <c-w>k
  map <c-l> <c-w>l
  map <c-h> <c-w>h
  " Move between errors
  " nmap <silent> <C-k> <Plug>(ale_previous_wrap)
  " nmap <silent> <C-j> <Plug>(ale_next_wrap)
  " Search for visually selected text
  vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
  " Copy visually selected text into system clipboard
  vnoremap <C-c> "*y

  if has('nvim') && !empty($CONDA_PREFIX)
    let g:python3_host_prog = $CONDA_PREFIX . '/bin/python'
  endif

  " Plugings
  " --------
  runtime plugins.vim
  runtime plugs-config.vim

  " LSP configuration
  " -----------------
  set completeopt=menuone,noselect

  if has('nvim')
    lua require('lsp-config')
  endif
endif
