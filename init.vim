


""""""""""""""""""""
" Vim-plug
""""""""""
call plug#begin('~/.local/share/nvim/plugged')

" Other
" Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-commentary'

call plug#end()
""""""""""""""""""""
source ~/.config/nvim/general.vim
source ~/.config/nvim/keymappings.vim
source ~/.config/nvim/langs.vim
source ~/.config/nvim/uiconfig.vim
source ~/.config/nvim/opam.vim

""""""""""""""""""""
" Plug-in configuration
""""""""""

"" vim-commentary
autocmd FileType ocaml setlocal commentstring=(*\ %s\ *)






