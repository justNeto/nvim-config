local keymap = vim.keymap

-- Set file navigation shortcuts for fuzzy finding and tree
keymap.set("n", "<leader>ff", ":FzfLua files<Enter>")
keymap.set("n", "<leader><space>", ":FzfLua live_grep<Enter>")
keymap.set("n", "<leader>sg", ":FzfLua git_files<Enter>")
keymap.set("n", "<leader>sb", ":FzfLua buffers<Enter>")
keymap.set("n", "<leader>sm", ":FzfLua marks<Enter>")

-- File and tree viewers
keymap.set("n", "<leader>e", ":NvimTreeToggle<Enter>")
keymap.set("n", "<leader>,", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Appending to current line the next line
keymap.set("n", "J", "mzJ`z")

-- Moving line blocks around
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Easier navigation in vim centering the line after C-u or C-d
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- Remap some other stuff
keymap.set("n", "c", "\"_c")

-- Folding code using ufo plugin `zR` and `zM`
--keymap.set('n', 'zR', require('ufo').openAllFolds)
--keymap.set('n', 'zM', require('ufo').closeAllFolds)

-- Shortcutting split navigation, saving a keypress:
keymap.set("n", "<leader>h", "<C-w>h")
keymap.set("n", "<leader>j", "<C-w>j")
keymap.set("n", "<leader>l", "<C-w>l")
keymap.set("n", "<leader>k", "<C-w>k")

keymap.set("n", "<leader>hs","<cmd>split<cr>")
keymap.set("n", "<leader>vs","<cmd>vsplit<cr>")

keymap.set("x", "<leader>p", "\"_dP") -- copying and pasting without overwriting vim yank buffer
keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- yanking or deleting to system's clipboard
keymap.set({ "n", "v" }, "<leader>d", [["_d]]) -- delete without sending to vim clipboard

-- Replace ex mode with gq... but actually no lol
keymap.set("n", "Q", "<nop>")

-- Change into a different project using tmux
keymap.set("n", "<leader>nf", ":silent !tmux neww tmux-sessionizer <CR>")

-- Replace all matches using capital S in current word in normal mode
keymap.set("n", "S", ":%s//g<Left><Left>")

-- Use leader s to match and replace
keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>")

-- Compile document, be it groff/LaTeX/markdown/etc.
keymap.set("n", "<leader>c", ":w! | !com <c-r>%<CR>")

-- Open corresponding .pdf/.html or preview
keymap.set("n", "<leader>o", ":!opout <c-r>%<CR><CR>")
