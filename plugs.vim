
""""""""""""""""""""
" Vim-plug
""""""""""
call plug#begin('~/.local/share/nvim/plugged')

""" Colorschemes
Plug 'morhetz/gruvbox' "https://github.com/morhetz/gruvbox
Plug 'ayu-theme/ayu-vim' " https://github.com/ayu-theme/ayu-vim
Plug 'junegunn/seoul256.vim'


""" UI
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'


""" Auto complete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }


""" Linter
Plug 'dense-analysis/ale'


""" Language specific plugins

"" Solidity
" Plug 'tomlion/vim-solidity' " , { 'for': 'solidity' }
Plug 'TovarishFin/vim-solidity' " , { 'for': 'solidity' }

"" javascript
Plug 'pangloss/vim-javascript' " , {'for': 'javascript'}
" Plug 'mxw/vim-jsx'

"" typescript
Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'

"" OCaml
Plug 'ocaml/vim-ocaml'

"" Lua
Plug 'tbastos/vim-lua'

"" Golang
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"" Coq
" Plug 'whonore/Coqtail'

"" Rust
Plug 'rust-lang/rust.vim'

"" TeX
Plug 'lervag/vimtex'

"" TOML
Plug 'cespare/vim-toml'

"" Comments
Plug 'tpope/vim-commentary'

call plug#end()
""""""""""""""""""""

