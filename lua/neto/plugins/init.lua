return {
    "nvim-lua/plenary.nvim",
    "christoomey/vim-tmux-navigator",
    'nvim-tree/nvim-web-devicons',
    { 'mbbill/undotree' },
    { 'folke/zen-mode.nvim' },
    { 'https://github.com/google/vim-searchindex.git' },
    { 'tpope/vim-fugitive' },
    { 'tpope/vim-rhubarb' },
    { 'airblade/vim-gitgutter' },
    { 'nvim-pack/nvim-spectre'},
    {
        'echasnovski/mini.align',
        version = false,
    },
    {
        'dstein64/vim-startuptime',
        cmd = "StartupTime",
        init = function()
            vim.g.startuptime_tries = 10
        end,
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        main = "ibl",
        config = function()
            require("ibl").setup()
        end
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        dependenciens = {
            'nvim-treesitter/nvim-treesitter'
        }
    }
}
