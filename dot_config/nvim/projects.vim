call project#rc("~/projects")

Project  'foodin-qt'
Callback 'foodin-qt' , 'FoodinQtHook'
function! FoodinQtHook(...) abort
  if filereadable(getcwd() . '/build/build.ninja')
    setlocal makeprg=ninja\ -C\ build
  endif
endfunction

Project  'foodin'

Project  '~/.local/share/chezmoi'
Project  '~/.local/share/chezmoi/dot_config/nvim'

Project  '~/notes'
