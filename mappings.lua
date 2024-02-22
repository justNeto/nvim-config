vim.g.mapleader = ","

--[[ Set file navigation shortcuts for fuzzy finding and tree ]]
vim.keymap.set("n", "<leader>ff", ":Files<Enter>")
vim.keymap.set("n", "<leader><space>", ":Rg<Enter>")
vim.keymap.set("n", "<leader>fg", ":Buffers<Enter>")
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<Enter>")
vim.keymap.set("n", "<leader>-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

--[[ Appending to current line the next line ]]
vim.keymap.set("n", "J", "mzJ`z")

--[[ Moving line blocks around ]]
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--[[ Easier navigation in vim centering the line after C-u or C-d ]]
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--[[ Remap some other stuff ]]
vim.keymap.set("n", "c", "\"_c")

--[[ Folding code using ufo plugin `zR` and `zM` ]]
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

--[[ Shortcutting split navigation, saving a keypress: ]]
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>l", "<C-w>l")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>hs",":split<Enter>")

vim.keymap.set("x", "<leader>p", "\"_dP") -- copying and pasting without overwriting vim yank buffer
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- yanking or deleting to system's clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]]) -- delete without sending to vim clipboard

--[[ Replace ex mode with gq... but actually no lol ]]
vim.keymap.set("n", "Q", "<nop>")

--[[ Change into a different project using tmux ]]
vim.keymap.set("n", "<leader>nf", ":silent !tmux neww tmux-sessionizer <CR>")

--[[ Replace all matches using capital S in current word in normal mode ]]
vim.keymap.set("n", "S", ":%s//g<Left><Left>")

--[[ Use leader s to match and replace ]]
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>")

--[[ Compile document, be it groff/LaTeX/markdown/etc. ]]
vim.keymap.set("n", "<leader>c", ":w! | !com <c-r>%<CR>")

--[[ Open corresponding .pdf/.html or preview ]]
vim.keymap.set("n", "<leader>o", ":!opout <c-r>%<CR><CR>")

-- Filesystem operations
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>")

vim.api.nvim_create_autocmd({ "Filetype" }, {
	pattern = "mason",
	callback = function()
		vim.api.nvim_set_hl(0, 'MasonNormal', { link = 'Normal' })
	end
})
