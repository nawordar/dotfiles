let g:auto_save = 1
let g:auto_save_silent = 1

augroup ft_commit
  au!
  au FileType hgcommit  let b:auto_save = 0
  au FileType gitcommit let b:auto_save = 0
augroup END
