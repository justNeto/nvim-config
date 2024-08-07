return {
    "nvim-lua/plenary.nvim",
    "christoomey/vim-tmux-navigator",
    'nvim-tree/nvim-web-devicons',
    {'numToStr/Comment.nvim', opts = { }},
    { 'mbbill/undotree' },
    { 'folke/zen-mode.nvim' },
    { 'https://github.com/google/vim-searchindex.git' },
    { 'tpope/vim-fugitive' },
    { 'tpope/vim-rhubarb' },
    { 'airblade/vim-gitgutter' },
    {
        'NvChad/nvim-colorizer.lua',
        config = function()
            require 'colorizer'.setup()
        end
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
}
