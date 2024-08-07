vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap

-- Set file navigation shortcuts for fuzzy finding and tree
keymap.set("n", "<leader>ff", "<cmd>:FzfLua files<cr>")
keymap.set("n", "<leader><space>", "<cmd>:FzfLua live_grep<cr>")
keymap.set("n", "<leader>sg", "<cmd>FzfLua git_files<cr>")
keymap.set("n", "<leader>sb", "<cmd>FzfLua buffers<cr>")
keymap.set("n", "<leader>sm", "<cmd>FzfLua marks<cr>")

-- File and tree viewers
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")
keymap.set("n", "<leader>,", "<cmd>Oil<cr>")

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
keymap.set("n", "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>")
keymap.set("n", "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>")
keymap.set("n", "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>")
keymap.set("n", "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>")

keymap.set("n", "<leader>sh","<cmd>split<cr>")
keymap.set("n", "<leader>sv","<cmd>vsplit<cr>")

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
