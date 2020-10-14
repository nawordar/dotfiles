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
  Plug 'tpope/vim-surround'                    " Surround commands using cs
  Plug 'tpope/vim-abolish'                     " Advanced search/replace (:S) and coercion (cr*)
  Plug 'tpope/vim-sleuth'                      " Automatically adjust indent settings
  Plug 'tpope/vim-fugitive'                    " Git support
  Plug 'tpope/vim-rhubarb'                     " Github support
  Plug 'tpope/vim-projectionist'               " Quickly switch between files in project
  Plug 'tpope/vim-dispatch'                    " Project command runner
  Plug 'tpope/vim-eunuch'                      " UNIX helpers

  " Editing
  Plug 'junegunn/vim-easy-align'               " Align by character usint ga
  Plug 'Raimondi/delimitMate'                  " Automatically insert closing parens
  Plug 'dhruvasagar/vim-table-mode'            " Mode for editing tables
  Plug 'tomtom/tcomment_vim'                   " Easy commenting using gc
  Plug 'AndrewRadev/splitjoin.vim'             " gJ to join and gS to split lines smart
  Plug 'mbbill/undotree'                       " Visualize Vim undo tree
  Plug 'machakann/vim-swap'                    " Swap parameters with g<, g> or gs

  " Navigating
  Plug 'airblade/vim-rooter'                   " Auto :cd to project root
  Plug 'justinmk/vim-sneak'                    " Another motion for Vim
  Plug 'liuchengxu/vim-clap',                  " File finder
    \ { 'do': ':Clap install-binary' }
  Plug 'liuchengxu/vista.vim'                  " Tag searcher

  " Visual
  Plug 'mhartington/oceanic-next'              " Oceanic theme
  Plug 'machakann/vim-highlightedyank'         " Highlight yanked region
  Plug 'nathanaelkane/vim-indent-guides'       " Indent guides

  " LSP and snippets
  Plug 'editorconfig/editorconfig-vim'         " .editorconfig support
  Plug 'prabirshrestha/vim-lsp'                " LSP support for Vim
  Plug 'mattn/vim-lsp-settings'                " Easy LS installation
  Plug 'SirVer/ultisnips'                      " Snippet engine
  Plug 'Shougo/deoplete.nvim',                 " Asynchronous completion
    \ { 'do': ':UpdateRemotePlugins' }
  Plug 'lighttiger2505/deoplete-vim-lsp'       " vim-lsp deoplete integration
  Plug 'thomasfaingnaert/vim-lsp-ultisnips'    " vim-lsp Ultisnips integration

  " Language support
  Plug 'dhruvasagar/vim-dotoo'                 " org-mode alternative
  Plug 'jceb/vim-orgmode'                      " org-mode support
  Plug 'lervag/vimtex',                        " Latex support
    \ { 'for': 'latex' }
  Plug 'chrisbra/csv.vim'                      " CSV support
    \ { 'for': 'csv' }
  Plug 'chr4/nginx.vim'                        " Nginx support
  Plug 'peterhoeg/vim-qml'                     " Qt QML support
  Plug 'cespare/vim-toml'                      " TOML support
    \ { 'for': 'toml' }
  Plug 'dmix/elvish.vim'                       " Elvish support
    \ { 'for': 'elvish' }
  Plug 'aklt/plantuml-syntax'                  " PlantUML support
    \ { 'for': 'plantuml' }

  " Other
  Plug 'moll/vim-bbye'                         " Sane buffer deleting
  Plug '~/clones/vim-autoformat'               " Autoformatting
  Plug 'puremourning/vimspector'               " Debugging

call plug#end()
