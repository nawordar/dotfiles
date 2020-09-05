let mapleader      = "\<Space>"
let maplocalleader = "\\"

set showbreak=→    " Prepend arrow to splitted lines
set copyindent     " Copy the previous indentation on autoindenting
set expandtab      " Expand tabs by default
set shiftround     " Use multiple of shiftwidth when indenting with '<' and '>'
set smartindent    " Context-aware indenting. Source: https://vi.stackexchange.com/a/5844
set shiftwidth=4   " Number of spaces to use for autoindenting
set softtabstop=4  " When hitting <BS>, pretend like a tab is removed, even if spaces
set tabstop=4      " Tabs are n spaces
set number         " Display line numbers
set relativenumber " Display numbers relatively
set undofile       " Make backups 
set hidden         " Allow changing buffers without saving
set smartcase      " Smart search and replace
set gdefault       " Make 'g' a default replace flag
set conceallevel=2 " Enable character concealing
set list           " Show redundant spaces
set foldmethod 
  \=syntax         " Fold basing on syntax
set nofoldenable   " Don't fold at start

                   " " Copy to system clipboard
" set clipboard=unnamedplus

" Highlight SCons files
autocmd BufReadPre SConstruct set filetype=python
autocmd BufReadPre SConscript set filetype=python

" Easier window mappings
nnoremap <leader>w 

" Open last file
nnoremap <leader>` :e #<cr>

" Delete buffer using fzf
nnoremap <leader>Q :BDelete<cr>

" Delete current buffer
nnoremap <leader>q :Bdelete<cr>

" Stop highlighting search result
nnoremap <silent> <esc> :noh<cr>

" TODO Make '#' and '*' not move cursor on the first select
