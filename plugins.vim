call plug#begin()

" Color themes for neovim
Plug 'fcpg/vim-fahrenheit'

" Fuzzy finder, nvim tree and oil for file editing/delete/creation
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stevearc/oil.nvim'

" Color-related configuration
" Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
" Plug 'KabbAmine/vCoolor.vim'

" Quality of life (syntax, commenting, undotree, etc)
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'terryma/vim-multiple-cursors'
Plug 'numToStr/Comment.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'mbbill/undotree'
Plug 'kevinhwang91/nvim-ufo'
Plug 'kevinhwang91/promise-async'
Plug 'ThePrimeagen/harpoon'
Plug 'folke/zen-mode.nvim'
" Plug 'epwalsh/obsidian.nvim'

" Status line prettifier
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/powerline-extra-symbols'
Plug 'edkolev/tmuxline.vim'

" Better search in vim
Plug 'https://github.com/google/vim-searchindex.git'

" Vim plugins for git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'

" Plug colorizer
Plug 'NvChad/nvim-colorizer.lua'

" LSP configuration
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" - Autocompletion engine plugins
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'

" Snippets
Plug 'rafamadriz/friendly-snippets'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'}

Plug 'folke/noice.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'rcarriga/nvim-notify'
"
call plug#end()
