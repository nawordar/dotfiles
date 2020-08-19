let mapleader = "\<Space>"
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

" Show buffer list
nnoremap <leader>b :Buffers<cr>

" Show list of files in the current directory
nnoremap <leader>. :Files %:h<cr>

" Open last file
nnoremap <leader>` :e #<cr>

" Delete buffer using fzf
" Source: https://github.com/junegunn/fzf.vim/pull/733#issuecomment-559720813
function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BDelete call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--reverse'
\ }))

nnoremap <leader>Q :BDelete<cr>

" Delete current buffer
nnoremap <leader>q :Bdelete<cr>

" Stop highlighting search result
nnoremap <silent> <esc> :noh<cr>

command Cha execute "!chezmoi apply"
