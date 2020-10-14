function! chezmoi#Update()
  write
  call system("chezmoi apply")

  execute "source" $MYVIMRC
endfunction
