local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end)

-- vim.api.nvim_create_autocmd({ "Filetype" }, {
--   pattern = "harpoon",
--   callback = function()
--     vim.opt.cursorline = false
--     vim.opt.relativenumber = true
--     vim.api.nvim_set_hl(0, 'HarpoonWindow', { link = 'Normal' })
--     vim.api.nvim_set_hl(0, 'HarpoonBorder', { link = 'Normal' })
--   end
-- })
