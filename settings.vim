" Some basics:
set number relativenumber
set termguicolors
set nocompatible
set nohlsearch

set guifont=Hack\ Regular\ Nerd\ Font\ Comeplete\ 12
set encoding=utf-8
set shortmess-=S
set conceallevel=1

set guicursor=" "

" Using tab configuration
set noexpandtab
let s:tabwidth=4
exec 'set tabstop='    .s:tabwidth
exec 'set shiftwidth=' .s:tabwidth
exec 'set softtabstop='.s:tabwidth

" Color schemes
colorscheme fahrenheit

" Allows to select commands in command mode
set wildmode=longest,list,full
set completeopt=menu,menuone,noselect

" Activate auto indent depending on filetype and turn syntax on
filetype plugin indent on
filetype plugin on
syntax enable

" Automatically saves when losing focus
autocmd BufLeave,FocusLost * silent! wall

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear %

" Setting some other extensions
autocmd BufNewFile,BufRead *.razor,*.cshtml, set syntax=html

" Do stuff after reading
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown

" Set filetype
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.rmd,*.qmd set filetype=markdown
autocmd BufRead,BufNewFile *.launch set filetype=xml
autocmd BufRead,BufNewFile *.tex set filetype=tex

autocmd BufRead,BufNewFile *.md,*.rmd,*.qmd,*.Rmd,*.Qmd set conceallevel=0
autocmd BufRead,BufNewFile *.json* set conceallevel=0

" autocmd FileType markdown setlocal concealcursor=nvic
" au FileType mark setl conceallevel=0

" Automatically deletes all trailing whitespace and newlines at end of file on save.
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritepre * %s/\n\+\%$//e

" When shortcut files are updated, renew bash and ranger configs with new material:
autocmd BufWritePost files,directories !shortcuts

set guifont=Inconsolata\ Nerd\ Font\ 12
