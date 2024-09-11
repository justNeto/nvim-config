-- These are my nvim settings

local opt                = vim.opt
local tabwidth           = 4

-- General settings
opt.relativenumber       = true
opt.number               = true

-- Shift and tab settings
opt.tabstop              = tabwidth
opt.shiftwidth           = tabwidth
opt.softtabstop          = tabwidth
opt.expandtab            = true
opt.autoindent           = true
opt.smartindent          = true
opt.wrap                 = false
opt.backspace            = "indent,eol,start"

-- Fold settings
vim.o.foldcolumn = '0' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Search settings
opt.ignorecase           = true
opt.smartcase            = true
opt.hlsearch             = false
opt.incsearch            = true

-- Color settings
opt.termguicolors        = true
opt.background           = "dark"
opt.signcolumn           = "yes"
-- opt.cursorline        = true

-- Spliting windows
opt.splitright           = true
opt.splitbelow           = true

-- Wildmode settings
vim.o.wildmode           = "longest,list,full"
vim.o.wildignorecase     = true
vim.o.completeopt        = "menu,menuone,noselect"

-- Disable netrw by default
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

-- Some automatic indentation for specific filetypes
vim.cmd([[
    augroup FiletypeSettings
        autocmd!
        autocmd FileType python setlocal shiftwidth=4 tabstop=4 expandtab
        autocmd FileType json setlocal shiftwidth=2 tabstop=2 expandtab
        autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab
        autocmd FileType lua setlocal shiftwidth=4 tabstop=4 expandtab
    augroup END
]])

-- Setting more filetypes
vim.cmd([[autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff]])
vim.cmd([[autocmd BufRead,BufNewFile *.rmd,*.qmd set filetype=markdown]])
vim.cmd([[autocmd BufRead,BufNewFile *.launch set filetype=xml]])
vim.cmd([[autocmd BufRead,BufNewFile *.tex set filetype=tex]])
vim.cmd([[autocmd BufRead,BufNewFile *.md,*.rmd,*.qmd,*.Rmd,*.Qmd set conceallevel=0]])
vim.cmd([[autocmd BufRead,BufNewFile *.json* set conceallevel=0]])

-- Automatically deletes all trailing whitespace and newlines at end of file on save.
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])
vim.cmd([[autocmd BufWritepre * %s/\n\+\%$//e]])

-- Save automatically when focus is lost on the buffer
vim.cmd([[autocmd BufLeave,FocusLost * silent! wall]])
