let g:deoplete#enable_at_startup = 1

call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])

inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
" inoremap <expr><C-y> pumvisible() ? deoplete#auto_complete() : "\<C-y>"
