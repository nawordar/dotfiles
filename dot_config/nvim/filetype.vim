if exists('did_load_filetypes') | finish | endif

augroup filetypedetect
  au!

  " Highlight Doxygen files
  au BufNewFile,BufRead *.dox         set filetype=cpp

   " Recognize .clang-format as YAML
  au BufNewFile,BufRead .clang-format set filetype=yaml

  " Highlight SCons files
  au BufNewFile,BufRead SConstruct    set filetype=python
  au BufNewFile,BufRead SConscript    set filetype=python

augroup END
