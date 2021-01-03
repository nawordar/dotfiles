let g:formatters_python = ['black', 'yapf', 'autopep8']
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0

augroup autoformat_group
  au!
  au FileType d nnoremap <buffer> <silent> <localleader>f :Autoformat<cr>
augroup END
