call plug#begin()
     Plug 'tpope/vim-sensible'
     Plug 'junegunn/vim-easy-align'
     Plug '~/.fzf'
     Plug 'junegunn/fzf.vim'         " For :Files command
     Plug 'Yggdroot/indentLine'      " Adds indent hints
     Plug 'Shougo/deoplete.nvim',    " Asynchronous completion
      \ { 'do': ':UpdateRemotePlugins' }
     Plug 'SirVer/ultisnips'         " Snippet engine
     Plug 'scrooloose/nerdcommenter' " Quick commenting
     Plug 'tpope/vim-surround'       " Surround commands
     Plug 'glacambre/firenvim',      " Browser integration
      \ { 'do': { _ -> firenvim#install(0) } } 

     " Language plugs
     Plug 'vim-latex/vim-latex',     " Latex engine
      \ { 'for': 'latex' }
call plug#end()


" === Color settings === "
" Source: Color scheme source files such as https://github.com/andreasvc/vim-256noir/blob/master/colors/256_noir.vim

if has("gui_running") || &t_Co == 256
    hi ErrorMsg ctermbg=197 " Set error msg foreground to a pinkish one
endif

" === Indentation settings === "
" Source: Mainly adevore3's comment at https://coderwall.com/p/vyckiw/vim-auto-indent-4-spaces

set copyindent     " Copy the previous indentation on autoindenting
set expandtab      " Expand tabs by default
set shiftround     " Use multiple of shiftwidth when indenting with '<' and '>'
set smartindent    " Context-aware indenting. Source: https://vi.stackexchange.com/a/5844
set shiftwidth=4   " Number of spaces to use for autoindenting
set softtabstop=4  " When hitting <BS>, pretend like a tab is removed, even if spaces
set tabstop=4      " tabs are n spaces
set number         " Display line numbers
set relativenumber " Display numbers relatively


" === EasyAlign settings === "
" EasyAlign mappings. Source: https://github.com/junegunn/vim-easy-align#quick-start-guide
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" === NERD Commenter settings === "
" Source: https://github.com/scrooloose/nerdcommenter

let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
