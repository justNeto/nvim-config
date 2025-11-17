return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
        'saadparwaiz1/cmp_luasnip',
        'rafamadriz/friendly-snippets',
        'onsails/lspkind.nvim'
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")

        -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            completion = {
                completeopt = "menu,menuone,preview,noselect",
            },
            snippet = { -- configure how nvim-cmp interacts with snippet engine
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
            ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion
            ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
            ["<Tab>"] = cmp.mapping.select_next_item(), -- next suggestion
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<C-Enter>"] = cmp.mapping.complete()
        }),
        -- sources for autocompletion
        sources = cmp.config.sources({
            { name = "luasnip" }, -- snippets
            { name = "buffer" }, -- text within current buffer
            { name = "path" }, -- file system paths
        }),

        -- configure lspkind for vs-code like pictograms in completion menu
        formatting = {
            format = lspkind.cmp_format({
                maxwidth = 50,
                ellipsis_char = "...",
            }),
        },
    })
end,
}
