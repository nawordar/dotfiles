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

" Add new projectionist variables
function! s:add_projectionist_variables(...) abort
  for variable in a:000
    for [root, value] in projectionist#query(variable)
      call setbufvar('', variable, value)
      break
    endfor
  endfor
endfunction

autocmd User ProjectionistActivate call s:add_projectionist_variables('test', 'watch')

" Based on: https://github.com/tpope/vim-dispatch/blob/fe6a34322829e466a7e8ce710a6ac5eabddff9fd/autoload/dispatch.vim#L494
function! s:dispatch(variable, opts) abort
  let program = get(b:, a:variable)
  if type(program) == type('')
    call dispatch#start(program, a:opts)
  endif
endfunction

command! Test call s:dispatch('test', {'wait': 'always'})
command! Watch call s:dispatch('watch', {'wait': 'never', 'background': v:true})

" Update Vim config
command! ChezmoiUpdate call chezmoi#Update()
cnoreabbrev CU ChezmoiUpdate
