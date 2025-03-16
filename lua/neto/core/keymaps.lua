local keymap = vim.keymap

-- Set file navigation shortcuts for fuzzy finding and tree
keymap.set("n", "<leader>st", "<cmd>TodoFzfLua<cr>")
keymap.set("n", "<leader>sf", "<cmd>FzfLua files<cr>")
keymap.set("n", "<leader>sm", "<cmd>FzfLua marks<cr>")
keymap.set("n", "<leader>sb", "<cmd>FzfLua buffers<cr>")
keymap.set("n", "<leader>sg", "<cmd>FzfLua git_files<cr>")
keymap.set("n", "<leader>sr", "<cmd>FzfLua registers<cr>")
keymap.set("n", "<leader>sw", "<cmd>FzfLua grep_cword<cr>")
keymap.set("n", "<leader><space>", "<cmd>FzfLua live_grep<cr>")

-- Todo comments
keymap.set("n", "]t", "<cmd>lua require('todo-comments').jump_next()<cr>")
keymap.set("n", "[t", "<cmd>lua require('todo-comments').jump_prev()<cr>")

-- File and tree viewers
keymap.set("n", "<leader>,", "<cmd>Oil<cr>")
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")

-- Appending to current line the next line
keymap.set("n", "J", "mzJ`z")

-- Moving line blocks aroun:
keymap.set("v", "J", ":m '>+1<cr>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Easier navigation in vim centering the line after C-u or C-d
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- Remap some other stuff
keymap.set("n", "c", "\"_c")

-- Add centering after search
keymap.set('n', 'n', 'nzz', { noremap = true, silent = true })
keymap.set('n', 'N', 'Nzz', { noremap = true, silent = true })

-- Shortcutting split navigation, saving a keypress:
keymap.set("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>")
keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
keymap.set("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>")

keymap.set("n", "<leader>w","<C-w>")
keymap.set("n", "<leader>sv","<C-w>v")
keymap.set("n", "<leader>sh","<C-w>s")
keymap.set("n", "<leader>se","<C-w>=")
keymap.set("n", "<leader>sx","<cmd>close<cr>")

-- Dismissing noice messages
keymap.set("n", "<leader>nd","<cmd>NoiceDismiss<cr>")

-- Copy, pasting and other
keymap.set("x", "<leader>p", "\"_dP") -- pasting without overwriting vim clipboard
keymap.set("n", "<leader>P", [["+p"]]) -- pasting from system's clipboard
keymap.set({ "n", "v" }, "<leader>d", [["_d]]) -- delete without sending to vim clipboard
keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- yanking or deleting to system's clipboard

-- Replace ex mode with gq... but actually no lol
keymap.set("n", "Q", "<nop>")

-- Change into a different project using tmux
--SS keymap.set("n", "<leader>nf", "<cmd>silent !tmux neww tmux-sessionizer <cr>")SS

-- Set undotree keymap
keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>")

-- Spectre files
keymap.set('n', '<leader>ts', '<cmd>lua require("spectre").toggle()<CR>')
keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>')
keymap.set('v', '<leader>scw', '<esc><cmd>lua require("spectre").open_visual()<CR>', { desc = "Search current word" })
keymap.set('n', '<leader>scw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', { desc = "Search current word" })
