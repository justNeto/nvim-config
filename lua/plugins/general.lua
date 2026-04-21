-- plugins
vim.pack.add({
	{ src = "https://github.com/Wansmer/treesj" },
	{ src = "https://github.com/mbbill/undotree" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/google/vim-searchindex.git" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/christoomey/vim-tmux-navigator" },
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim" },

	-- Colorschemes section
	{ src = "https://github.com/fcpg/vim-fahrenheit" },
	{ src = "https://github.com/rose-pine/neovim" },
})

-- vigoux/oak
-- rose-pine/neovim
-- vim.cmd("colorscheme rose-pine")
vim.cmd("colorscheme fahrenheit")
vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = "#36180E" })
require("ibl").setup() -- indent blanklike startup callout
require("treesj").setup() -- indent blanklike startup callout
