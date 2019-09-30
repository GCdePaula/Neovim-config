
""""""""""""""""""""
" Vim-plug
""""""""""
call plug#begin('~/.local/share/nvim/plugged')

"" Colorschemes
Plug 'morhetz/gruvbox' "https://github.com/morhetz/gruvbox
Plug 'ayu-theme/ayu-vim' " https://github.com/ayu-theme/ayu-vim
Plug 'junegunn/seoul256.vim'


"" UI
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'


"" Auto complete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }


"" Linter
Plug 'w0rp/ale'


"" Language specific plugins
" Solidity
Plug 'tomlion/vim-solidity' " , { 'for': 'solidity' }

" javascript
Plug 'pangloss/vim-javascript' " , {'for': 'javascript'}
Plug 'mxw/vim-jsx'

" typescript
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" OCaml
Plug 'let-def/ocp-indent-vim'

" Lua
Plug 'tbastos/vim-lua'

" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


"" Comments
Plug 'tpope/vim-commentary'

call plug#end()
""""""""""""""""""""

