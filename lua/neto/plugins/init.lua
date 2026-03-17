return {
    { 'tpope/vim-fugitive' }, -- remove
    { 'tpope/vim-rhubarb' }, -- remove
    { 'airblade/vim-gitgutter' }, -- TODO: review if will use
    { 'nvim-pack/nvim-spectre'},
    { 'echasnovski/mini.align', version = false, }, -- review if needed
    {
        "Wansmer/treesj",
        keys = {"<leader>m"},
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("treesj").setup({})
        end
    }
}
