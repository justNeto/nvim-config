return
{
	{
		'nyoom-engineering/oxocarbon.nvim',
		lazy 		= false,
		priority 	= 1000,
		config 		= function()
			vim.cmd([[colorscheme oxocarbon]])
            vim.opt.background = "dark" -- set this to dark or light
		end,
	},
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            vim.cmd("colorscheme rose-pine")
        end
    }
}
