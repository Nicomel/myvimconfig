
call plug#begin()
" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'Raimondi/delimitMate'
Plug 'tomasr/molokai'
Plug 'jacoborus/tender.vim'
Plug 'joshdick/onedark.vim'
Plug 'dstein64/nvim-scrollview'
" Plug 'ap/vim-css-color'
Plug 'chrisbra/Colorizer'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" On-demand loading
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ojroques/nvim-lspfuzzy'
Plug 'rust-lang/rust.vim'
Plug 'psf/black'
Plug 'Yggdroot/indentLine'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mlaursen/vim-react-snippets'
" Plug 'glepnir/lspsaga.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
call plug#end()
