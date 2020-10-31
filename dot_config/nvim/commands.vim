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

" Add 'Test' command, similar to 'Start'
autocmd User ProjectionistActivate call s:activate()
function! s:activate() abort
  for [root, value] in projectionist#query('test')
    let b:test = value
    break
  endfor
endfunction

" Based on: https://github.com/tpope/vim-dispatch/blob/fe6a34322829e466a7e8ce710a6ac5eabddff9fd/autoload/dispatch.vim#L494
function! s:test_command()
  if type(get(b:, 'test')) == type('')
    call dispatch#start(b:test, {'wait': 'always'})
  endif
endfunction

command! Test call s:test_command()

" Update Vim config
command! ChezmoiUpdate call chezmoi#Update()
cnoreabbrev CU ChezmoiUpdate
