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
}
