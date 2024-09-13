return {
	{
		'ThePrimeagen/harpoon',
        branch = "harpoon2",
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			local harpoon = require("harpoon")
            local keymap = vim.keymap

            harpoon:setup()

			keymap.set("n", "<leader>a", function() harpoon:list():add() end)
            keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            keymap.set("n", "<leader>hh", function() harpoon:list():select(1) end)
            keymap.set("n", "<leader>tt", function() harpoon:list():select(2) end)
            keymap.set("n", "<leader>nn", function() harpoon:list():select(3) end)
            keymap.set("n", "<leader>ss", function() harpoon:list():select(4) end)
		end
	}
}
