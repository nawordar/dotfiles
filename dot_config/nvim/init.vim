if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !mkdir -p ~/.config/nvim/autoload
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
    " Editing
    Plug 'tpope/vim-sensible'                 " Sensible defaults
    Plug 'tpope/vim-repeat'                   " '.' for every command
    Plug 'tpope/vim-commentary'               " Easy commenting
    Plug 'junegunn/vim-easy-align'            " Align by character | ga
    Plug 'scrooloose/nerdcommenter'           " Quick commenting   | gc
    Plug 'tpope/vim-surround'                 " Surround commands  | cs

    " Navigating
    Plug 'junegunn/fzf',                      " For :Files command
        \ { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'                   

    " Visual
    Plug 'Yggdroot/indentLine'                " Adds indent hints
    Plug 'mhartington/oceanic-next'           " Oceanic theme

    " Advanced
    Plug 'prabirshrestha/vim-lsp'             " LSP support for Vim
    Plug '~/clones/vim-lsp-settings'          " Automatic LS installation
    Plug 'Shougo/deoplete.nvim',              " Asynchronous completion
       \ { 'do': ':UpdateRemotePlugins' }
    Plug 'lighttiger2505/deoplete-vim-lsp'    " vim-lsp deoplete integration
    Plug 'SirVer/ultisnips'                   " Snippet engine
    Plug 'thomasfaingnaert/vim-lsp-ultisnips' " vim-lsp Ultisnips integration
    " Plug 'thomasfaingnaert/vim-lsp-snippets'
    Plug 'moll/vim-bbye'                      " Sane buffer deleting
    Plug 'dhruvasagar/vim-dotoo'              " org-mode alternative
    Plug 'jceb/vim-orgmode'                   " org-mode support


     " Language plugs
     Plug 'vim-latex/vim-latex',     " Latex engine
      \ { 'for': 'latex' }
call plug#end()

source <sfile>:h/misc.vim
source <sfile>:h/theme.vim
source <sfile>:h/lsp.vim
source <sfile>:h/deoplete.vim
source <sfile>:h/easyalign.vim
