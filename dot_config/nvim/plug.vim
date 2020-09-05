if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !mkdir -p ~/.config/nvim/autoload
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

  " Tim Pope
  Plug 'tpope/vim-sensible'                    " Sensible defaults
  Plug 'tpope/vim-repeat'                      " '.' for every command
  Plug 'tpope/vim-commentary'                  " Easy commenting using gc
  Plug 'tpope/vim-surround'                    " Surround commands using cs
  Plug 'tpope/vim-abolish'                     " Advanced search/replace (:S) and coercion (cr*)
  Plug 'tpope/vim-sleuth'                      " Automatically adjust indent settings
  Plug 'tpope/vim-fugitive'                    " Git support
  Plug 'tpope/vim-rhubarb'                     " Github support

  " Editing
  Plug 'junegunn/vim-easy-align'               " Align by character usint ga
  Plug 'Raimondi/delimitMate'                  " Automatically insert closing parens
  Plug 'tommcdo/vim-exchange'                  " cx to exchange two words
  Plug 'dhruvasagar/vim-table-mode'            " Mode for editing tables

  " Navigating
  Plug 'amiorin/vim-project'                   " Auto :cd to project root
  Plug 'justinmk/vim-sneak'                    " Another motion for Vim
  Plug 'liuchengxu/vim-clap',                  " File finder
    \ { 'do': ':Clap install-binary' }

  " Visual
  Plug 'mhartington/oceanic-next'              " Oceanic theme
  Plug 'machakann/vim-highlightedyank'         " Highlight yanked region

  " LSP and snippets
  Plug 'editorconfig/editorconfig-vim'         " .editorconfig support
  Plug 'prabirshrestha/vim-lsp'                " LSP support for Vim
  Plug '~/clones/vim-lsp-settings'             " LSP support for Vim
  Plug 'Shougo/deoplete.nvim',                 " Asynchronous completion
    \ { 'do': ':UpdateRemotePlugins' }
  Plug 'lighttiger2505/deoplete-vim-lsp'       " vim-lsp deoplete integration
  Plug 'SirVer/ultisnips'                      " Snippet engine
  Plug 'thomasfaingnaert/vim-lsp-ultisnips'    " vim-lsp Ultisnips integration

  " Language support
  Plug 'dhruvasagar/vim-dotoo'                 " org-mode alternative
  Plug 'jceb/vim-orgmode'                      " org-mode support
  Plug 'lervag/vimtex',                        " Latex support
    \ { 'for': 'latex' }
  Plug 'chrisbra/csv.vim'                      " CSV support
    \ { 'for': 'csv' }
  Plug 'vim-crystal/vim-crystal'               " Crystal language support
  Plug 'chr4/nginx.vim'                        " Nginx support

  " Other
  Plug 'moll/vim-bbye'                         " Sane buffer deleting
  Plug 'yazgoo/vmux'                           " Vim as terminal multiplexer
  Plug 'neomake/neomake'                       " Asynchronous :make

call plug#end()
