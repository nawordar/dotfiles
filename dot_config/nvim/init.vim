source <sfile>:h/plug.vim
source <sfile>:h/misc.vim
source <sfile>:h/commands.vim
source <sfile>:h/delimitmate.vim
source <sfile>:h/vimspector.vim
source <sfile>:h/clap.vim
source <sfile>:h/theme.vim
source <sfile>:h/lsp.vim
source <sfile>:h/sql.vim
source <sfile>:h/deoplete.vim
source <sfile>:h/ultisnips.vim
source <sfile>:h/easyalign.vim
source <sfile>:h/dotoo.vim
source <sfile>:h/vimtex.vim
source <sfile>:h/autosave.vim

if filereadable(expand('<sfile>:h') . '/private.vim')
  source <sfile>:h/private.vim
endif
