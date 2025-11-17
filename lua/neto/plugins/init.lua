return {
    "nvim-lua/plenary.nvim",
    "christoomey/vim-tmux-navigator",
    'nvim-tree/nvim-web-devicons',
    { 'mbbill/undotree' },
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
        'lukas-reineke/indent-blankline.nvim',
        main = "ibl",
        config = function()
            require("ibl").setup()
        end
    },
    {
        "Wansmer/treesj",
        keys = {"<leader>m"},
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("treesj").setup({})
        end
    }
}
