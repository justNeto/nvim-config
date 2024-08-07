return {
    {
        "ibhagwan/fzf-lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        keys = {
            {'<leader>ff', '<cmd>FzfLua files<cr>'},
            {'<leader><space>', '<cmd>FzfLua live_grep<cr>'},
            {'<leader>sg', '<cmd>FzfLua git_files<cr>'},
            {'<leader>sb', '<cmd>FzfLua buffers<cr>'},
            {'<leader>sm', '<cmd>FzfLua marks<cr>'}
        },
        config = function()
            require("fzf-lua").setup({ "fzf-native" })
        end,
    }
}
