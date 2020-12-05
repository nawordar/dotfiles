let g:formatters_python = ['yapf', 'black', 'autopep8']

augroup autoformat_group
  au!
  au FileType d nnoremap <buffer> <silent> <localleader>f :Autoformat<cr>
augroup END
