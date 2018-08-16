" https://mendo.zone/fun/neovim-setup-haskell/
" more git commands: https://github.com/tpope/vim-fugitive
execute pathogen#infect()

set nocompatible

set mouse=a

set encoding=utf-8

set softtabstop=0
set expandtab
set tabstop=2
set shiftwidth=2

set number
set nobackup
set syntax=on
set autoindent

colorscheme slate

map Y y$
cab W w

map <C-n> :NERDTreeToggle<CR>

" == haskell-vim options =============
let g:haskell_indent_if = 2
let g:haskell_indent_case = 4
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 2
let g:haskell_indent_case_alternative = 1
let g:cabal_indent_section = 2

" == Intero options ===================
" " Automatically reload on save
au BufWritePost *.hs InteroReload

" Lookup the type of expression under the cursor
au FileType haskell nmap <silent> <leader>t <Plug>InteroGenericType
au FileType haskell nmap <silent> <leader>T <Plug>InteroType
" Insert type declaration
au FileType haskell nnoremap <silent> <leader>ni :InteroTypeInsert<CR>
" Show info about expression or type under the cursor
au FileType haskell nnoremap <silent> <leader>i :InteroInfo<CR>

" Open/Close the Intero terminal window
au FileType haskell nnoremap <silent> <leader>nn :InteroOpen<CR>
au FileType haskell nnoremap <silent> <leader>nh :InteroHide<CR>

" Reload the current file into REPL
au FileType haskell nnoremap <silent> <leader>nf :InteroLoadCurrentFile<CR>
" Jump to the definition of an identifier
au FileType haskell nnoremap <silent> <leader>ng :InteroGoToDef<CR>
" Evaluate an expression in REPL
au FileType haskell nnoremap <silent> <leader>ne :InteroEval<CR>

" Start/Stop Intero
au FileType haskell nnoremap <silent> <leader>ns :InteroStart<CR>
au FileType haskell nnoremap <silent> <leader>nk :InteroKill<CR>

" Reboot Intero, for when dependencies are added
au FileType haskell nnoremap <silent> <leader>nr :InteroKill<CR> :InteroOpen<CR>

" Managing targets
" Prompts you to enter targets (no silent):
au FileType haskell nnoremap <leader>nt :InteroSetTargets<CR>
