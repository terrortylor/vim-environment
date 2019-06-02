" Always show the tab line
set showtabline=2

" Configure indentation to spaces of width 2
" https://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

" See: https://vim.fandom.com/wiki/Display_line_numbers
" show current line number and relative line numbers
set number relativenumber!
" toggle relative number
nnoremap <leader>rln :set relativenumber!<CR>

" Format the status line
set laststatus=2
set statusline=%f       "Path of the file
set statusline+=%=      "left/right separator
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%3c,     "cursor column
set statusline+=%4l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

" Configure netrw plugin to show file ls details
" See: https://shapeshed.com/vim-netrw/
let g:netrw_liststyle = 1

" See: https://vim.fandom.com/wiki/Resize_splits_more_quickly
" Increase/Decrease vertical windows
nnoremap <leader>+ :vertical resize +10<CR>
nnoremap <leader>- :vertical resize -10<CR>

" autosave buffers when switching between then
set autowrite

" Enable mouse support
":set mouse=a

" Set searching to only use case when an uppercase is used
set ignorecase
set smartcase
" Highlight search
set incsearch
set showmatch
set hlsearch
" turns of highlighting
nnoremap <leader><space> :noh<CR>

" enable syntax highlighting
syntax enable

" enable spell checking
set spell spelllang=en_gb

" Create some shortcuts
" NOTE: leader is default '\'
" Toggle spell checking
nnoremap <leader>s :set spell!<CR>

" Open new tab in explorer
nnoremap <leader>E :Texplore<CR>

" Map 'jj' in insert more to escape back to normal
inoremap jj <ESC>

" Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Plugin specific
" CtrlP
" set a larger than defalt maximum file limit
let g:ctrlp_max_files=200000
let g:ctrlp_max_depth=40
" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
\ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$|\.vagrant$|\.kitchen$',
\ 'file': '\.so$\|\.dat$|\.DS_Store$'
\}