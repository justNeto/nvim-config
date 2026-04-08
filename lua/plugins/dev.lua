-- plugins
vim.pack.add({
	{ src = "https://github.com/folke/flash.nvim" },
	{ src = "https://github.com/numToStr/Comment.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/folke/todo-comments.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
	-- {
	-- 	src = "https://github.com/justNeto/harpoon",
	-- 	version = "neto/nvim-nightly-fix"
	-- },
	{ src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
})

-- Add whatever specific config/setup for some plugin e.g.
-- require('plugin').setup({
--     ...
-- })
require("todo-comments").setup()
require("fzf-lua").setup({ "fzf-native", winopts = { split = "belowright new" } })
require("harpoon").setup({
	settings = {
		save_on_toggle = true,
		save_on_change = true,
		tabline = true,
	},
})

-- configure plugin
require("flash").setup({
	jump = {
		autojump = true,
	},
	modes = {
		char = {
			jump_labels = true,
			multi_line = false,
		},
		search = {
			enabled = false,
		},
		remote_op = {
			restore = true,
			motion = true,
		},
	},
})

-- keymaps
vim.keymap.set({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end, { desc = "Flash" })

vim.keymap.set({ "n", "x", "o" }, "S", function()
	require("flash").treesitter()
end, { desc = "Flash Treesitter" })

vim.keymap.set("o", "r", function()
	require("flash").remote()
end, { desc = "Remote Flash" })

vim.keymap.set({ "o", "x" }, "R", function()
	require("flash").treesitter_search()
end, { desc = "Treesitter Search" })

require("conform").setup({
	formatters_by_ft = {
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		svelte = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		graphql = { "prettier" },
		liquid = { "prettier" },
		lua = { "stylua" },
		python = { "isort" },
		go = { "golangci-lint" },
	},
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	},
})

require("nvim-treesitter").setup({
	-- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
	install_dir = vim.fn.stdpath("data") .. "/site",
})
require("nvim-treesitter").install({
	"rust",
	"javascript",
	"zig",
	"go",
	"c",
	"cpp",
	"lua",
	"typescript",
	"svelte",
	"tmux",
	"typst",
	"json",
})

require("nvim-treesitter-textobjects").setup({
	select = {
		-- Automatically jump forward to textobj, similar to targets.vim
		lookahead = true,
		-- You can choose the select mode (default is charwise 'v')
		--

		-- Can also be a function which gets passed a table with the keys
		-- * query_string: eg '@function.inner'
		-- * method: eg 'v' or 'o'
		-- and should return the mode ('v', 'V', or '<c-v>') or a table
		-- mapping query_strings to modes.
		selection_modes = {
			["@parameter.outer"] = "v", -- charwise
			["@function.outer"] = "V", -- linewise
			-- ['@class.outer'] = '<c-v>', -- blockwise
		},
		-- If you set this to `true` (default is `false`) then any textobject is
		-- extended to include preceding or succeeding whitespace. Succeeding
		-- whitespace has priority in order to act similarly to eg the built-in
		-- `ap`.
		--
		-- Can also be a function which gets passed a table with the keys
		-- * query_string: eg '@function.inner'
		-- * selection_mode: eg 'v'
		-- and should return true of false
		include_surrounding_whitespace = true,
	},
})

-- keymaps for SELECTING
-- You can use the capture groups defined in `textobjects.scm`
--
vim.keymap.set({ "x", "o" }, "af", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "if", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ac", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ic", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
end)
-- -- You can also use captures from other query groups like `locals.scm`
vim.keymap.set({ "x", "o" }, "as", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
end)

-- keymaps for SWAPPING
-- useful for swapping the current node in the tree for the next/previous one e.g. moving around function parameters
--
vim.keymap.set("n", "<leader>sn", function()
	require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
end)
vim.keymap.set("n", "<leader>sp", function()
	require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.outer")
end)

-- keymaps for MOVING
require("nvim-treesitter-textobjects").setup({
	move = {
		-- whether to set jumps in the jumplist
		set_jumps = true,
	},
})

-- -- [ == goto begining [something]
-- -- ] == goto end [something]
-- -- You can use the capture groups defined in `textobjects.scm`
-- vim.keymap.set({ "n", "x", "o" }, "{f", function()
-- 	require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
-- end)
-- vim.keymap.set({ "n", "x", "o" }, "{c", function()
-- 	require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
-- end)
-- -- You can also pass a list to group multiple queries.
-- vim.keymap.set({ "n", "x", "o" }, "{l", function()
-- 	require("nvim-treesitter-textobjects.move").goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects")
-- end)
-- -- You can also use captures from other query groups like `locals.scm` or `folds.scm`
-- vim.keymap.set({ "n", "x", "o" }, "{s", function()
-- 	require("nvim-treesitter-textobjects.move").goto_next_start("@local.scope", "locals")
-- end)
-- vim.keymap.set({ "n", "x", "o" }, "{z", function()
-- 	require("nvim-treesitter-textobjects.move").goto_next_start("@fold", "folds")
-- end)
--
-- vim.keymap.set({ "n", "x", "o" }, "}f", function()
-- 	require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
-- end)
-- vim.keymap.set({ "n", "x", "o" }, "}c", function()
-- 	require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
-- end)
--
-- vim.keymap.set({ "n", "x", "o" }, "[[", function()
-- 	require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
-- end)
-- -- vim.keymap.set({ "n", "x", "o" }, "{{", function()
-- --     require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
-- -- end)
--
-- vim.keymap.set({ "n", "x", "o" }, "{{", function()
-- 	require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
-- end)
-- -- vim.keymap.set({ "n", "x", "o" }, "[]", function()
-- --     require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
-- -- end)
--
-- -- Go to either the start or the end, whichever is closer.
-- -- Use if you want more granular movements
-- vim.keymap.set({ "n", "x", "o" }, "{d", function()
-- 	require("nvim-treesitter-textobjects.move").goto_next("@conditional.outer", "textobjects")
-- end)
-- vim.keymap.set({ "n", "x", "o" }, "}d", function()
-- 	require("nvim-treesitter-textobjects.move").goto_previous("@conditional.outer", "textobjects")
-- end)
