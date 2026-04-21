-- plugins
vim.pack.add({
	{ src = "https://github.com/L3MON4D3/LuaSnip", build = "make install_jsregexp" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/Saghen/blink.cmp", version = "v1.10.1" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
})

local lsp_langs = { "lua_ls", "ts_ls", "stylua", "clangd", "eslint_d", "isort", "gopls", "haskell-language-server" }
local treesitter_langs = {
	"zsh",
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
	"python",
	"haskell",
}

-- for _, value in ipairs(lsp_langs) do
-- 	print(value)
-- end

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = lsp_langs,
})

require("nvim-treesitter").setup({
	-- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
	install_dir = vim.fn.stdpath("data") .. "/site",
})

require("nvim-treesitter").install(treesitter_langs)

vim.api.nvim_create_autocmd("FileType", {
	pattern = treesitter_langs,
	callback = function()
		vim.treesitter.start()
	end,
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

-- TODO: check these
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

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = {
					"vim",
				},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})
require("luasnip.loaders.from_vscode").lazy_load()
require("blink.cmp").setup({
	signature = { enabled = true, window = { border = "rounded" } },
	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 500,
			treesitter_highlighting = true,
			window = { border = "rounded" },
		},
		ghost_text = { enabled = true },
		menu = {
			auto_show = true,
			draw = {
				treesitter = { "lsp" },
				columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" } },
				-- columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } }, -- nvim-cmp like
			},
		},
		list = {
			selection = {
				-- don't force Enter to accept the first item
				preselect = true,
				auto_insert = true,
			},
		},
		accept = { auto_brackets = { enabled = true } },
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
		providers = {
			lsp = {
				min_keyword_length = 2, -- Number of characters to trigger porvider
				score_offset = 0, -- Boost/penalize the score of the items
			},
			path = {
				min_keyword_length = 0,
			},
			snippets = {
				min_keyword_length = 2,
			},
			buffer = {
				min_keyword_length = 5,
				max_items = 5,
			},
		},
	},
	keymap = {
		["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
		["<C-e>"] = { "hide", "fallback" },
		["<C-y>"] = { "accept", "fallback" },
		["<C-k>"] = { "select_prev", "fallback" },
		["<C-j>"] = { "select_next", "fallback" },
		["<Tab>"] = {
			function(cmp)
				return cmp.select_next()
			end,
			"snippet_forward",
			"fallback",
		},
		["<S-Tab>"] = {
			function(cmp)
				return cmp.select_prev()
			end,
			"snippet_backward",
			"fallback",
		},

		["<Up>"] = { "select_prev", "fallback" },
		["<Down>"] = { "select_next", "fallback" },
		["<C-p>"] = { "select_prev", "fallback" },
		["<C-n>"] = { "select_next", "fallback" },
		["<C-up>"] = { "scroll_documentation_up", "fallback" },
		["<C-down>"] = { "scroll_documentation_down", "fallback" },
	},
	cmdline = {
		enabled = true,
		keymap = { preset = "inherit" },
		completion = { menu = { auto_show = true } },
	},
})

-- LSP references
-- diagnostic signs
local signs = {
	Error = " ",
	Warn = " ",
	Hint = "󰠠 ",
	Info = " ",
}

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- LSP keymaps: buffer-local, only when a server attaches
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf, silent = true }
		local keymap = vim.keymap

		opts.desc = "Show LSP references"
		keymap.set("n", "gR", "<cmd>FzfLua lsp_references<CR>", opts)

		opts.desc = "Go to declaration"
		keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

		opts.desc = "Show LSP definitions"
		keymap.set("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", opts)

		opts.desc = "Show LSP implementations"
		keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", opts)

		opts.desc = "Show LSP type definitions"
		keymap.set("n", "gt", "<cmd>FzfLua lsp_type_definitions<CR>", opts)

		opts.desc = "Code actions"
		keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

		opts.desc = "Rename symbol"
		keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

		opts.desc = "Show buffer diagnostics"
		keymap.set("n", "<leader>D", "<cmd>FzfLua diagnostics bufnr=0<CR>", opts)

		opts.desc = "Show line diagnostics"
		keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

		opts.desc = "Hover documentation"
		keymap.set("n", "K", vim.lsp.buf.hover, opts)

		opts.desc = "Restart LSP"
		keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)
	end,
})
