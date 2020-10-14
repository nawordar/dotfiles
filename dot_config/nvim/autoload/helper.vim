" Source: https://stackoverflow.com/a/6271254/9327802
function! helper#GetText(beg_lnum, beg_col, end_lnum, end_col)
  let l:lines = getline(a:beg_lnum, a:end_lnum)
  if len(l:lines) == 0
    return ''
  endif

  let l:lines[-1] = l:lines[-1][:a:end_col - 1]
  let l:lines[0] = l:lines[0][a:beg_col - 1:]

  return join(lines, "\n")
endfunction


" Find string in buffer
function! helper#Find(pat, flags)
  " Remove 'n' flag, since this function depends on cursor position.
  let l:beg_flags = substitute(a:flags, 'n', '', '')

  " Since 'w/W' flag is option dependent, it should always be present
  if stridx(l:beg_flags, 'w') == -1 && stridx(l:beg_flags, 'W') == -1
    let l:beg_flags = l:beg_flags . 'W'
  endif

  " Add 'c', so the match under cursor will be accepted
  " 'b(ack)' flag collides with 'e(nd)'
  let l:end_flags = substitute(l:beg_flags, 'b', '', '') . 'ec'

  " Save current cursor position if flag 'n' is present.
  " If flag 'n' is present, save position at the beginning of the match
  if stridx(a:flags, 'n') != -1
    let l:save_cursor = getcurpos()
    let [l:beg_lnum, l:beg_col] = searchpos(a:pat, l:beg_flags)
  else
    let [l:beg_lnum, l:beg_col] = searchpos(a:pat, l:beg_flags)
    let l:save_cursor = getcurpos()
  endif

  let [l:end_lnum, l:end_col] = searchpos(a:pat, l:end_flags)

  " Restore cursor position
  call setpos('.', l:save_cursor)

  " Pattern not found
  if l:beg_lnum == 0
    return ''
  endif

  let l:text = helper#GetText(beg_lnum, beg_col, end_lnum, end_col)

  return matchlist(l:text, a:pat)
endfunction
