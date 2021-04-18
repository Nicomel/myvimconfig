set nocompatible
filetype off      " required by vundle (see below)

set cursorline
set nowrap        " don't wrap lines

set mouse=a
set autoindent
set number        " Line numbers on

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

" lua << EOF
" vim.lsp.set_log_level("debug")
" EOF

" Change cursor style based on the mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

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
nnoremap <C-H> :bprev<cr>
nnoremap <C-L> :bnext<cr>
nnoremap <leader>w :bdelete<cr>
" Move between errors
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
" Search for visually selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

if has('nvim') && !empty($CONDA_PREFIX)
  let g:python3_host_prog = $CONDA_PREFIX . '/bin/python'
endif

" Plugings
" --------
source ~/.vim/plugins.vim
source ~/.vim/plugs-config.vim

" LSP configuration
" -----------------
set completeopt=menuone,noselect

if has('nvim')
"  source ~/.vim/lsp-config.vim
  luafile ~/.vim/lsp-config.lua
endif
