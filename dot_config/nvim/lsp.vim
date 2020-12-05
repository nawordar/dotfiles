let g:lsp_settings = {
      \   'clangd': {
      \     'cmd': [
      \       '/home/nawordar/apps/clangd-11/bin/clangd',
      \       '--header-insertion=never',
      \       '--log=verbose',
      \     ],
      \   },
      \   'pyls': {
      \     'plugins': {
      \       'pydocstyle': {'enabled':   v:true},
      \       'pyls_mypy':  {'enabled':   v:true,
      \                      'live_mode': v:false},
      \     },
      \   },
      \ }

if (executable('haskell-language-server-wrapper'))
  au User lsp_setup call lsp#register_server({
      \ 'name': 'haskell-language-server-wrapper',
      \ 'cmd': {server_info->['haskell-language-server-wrapper', '--lsp']},
      \ 'whitelist': ['haskell'],
      \ })
endif

" let g:lsp_documentation_float = 0

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes

  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gi <plug>(lsp-implementation)
  " nmap <buffer> gt <plug>(lsp-type-definition)
  nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
  nmap <buffer> K <plug>(lsp-hover)
  nmap <buffer> <localleader>r <plug>(lsp-rename)
  nmap <buffer> <localleader>f <plug>(lsp-document-format)
  nmap <buffer> <localleader>x <plug>(lsp-code-action)
endfunction

augroup lsp_install
  autocmd!
  " call s:on_lsp_buffer_enabled only for languages that have the server registered.
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Set LSP folding for languages that support it
augroup lsp_folding
  autocmd!
  autocmd FileType javascript setlocal
    \ foldmethod=expr
    \ foldexpr=lsp#ui#vim#folding#foldexpr()
    \ foldtext=lsp#ui#vim#folding#foldtext()
augroup end
