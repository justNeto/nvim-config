return
{
	{
		'fcpg/vim-fahrenheit',
		lazy 		= false,
		priority 	= 1000,
		config 		= function()
			vim.cmd([[colorscheme fahrenheit]])
		end,
	},
	-- {
 --        "savq/melange-nvim",
	-- 	lazy 		= false,
	-- 	priority 	= 1000,
 --        config      = function()
 --            vim.cmd([[colorscheme melange]])
 --        end
	-- },
    -- INFO: LOOKS GOOD!
	-- {
 --        "Love-Pengy/lillilac.nvim",
	-- 	lazy 		= false,
	-- 	priority 	= 1000,
 --        config      = function()
 --            vim.cmd([[colorscheme lillilac]])
 --        end
 --    },
    -- TEST: TRY
	-- {
 --        "bartekprtc/distinct.nvim",
	-- 	lazy 		= false,
	-- 	priority 	= 1000,
 --        config      = function()
 --            vim.cmd([[colorscheme distinct]])
 --        end
	-- },
}
