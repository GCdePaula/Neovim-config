
""""""""""""""""""""
" Vim-plug
""""""""""
call plug#begin('~/.local/share/nvim/plugged')

"" Auto complete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"" Linter
Plug 'w0rp/ale'

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

call plug#end()
""""""""""""""""""""

"" ale and deoplete
" Ignore ocamllex and ocamlyacc
let g:ale_pattern_options = {
\   '.*\.mll$': {'ale_enabled': 0},
\   '.*\.mly$': {'ale_enabled': 0},
\}

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint', 'tsserver'],
\   'solidity': ['solc', 'solhint'],
\   'go': ['gopls', 'golangci-lint'],
\   'ocaml' : ['merlin', 'ols'],
\}

let g:ale_solidity_solc_options = '--allow-paths .'
let g:ale_go_golangci_lint_options = ''

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\}

let g:ale_completion_enabled = 0
"let g:ale_lint_on_text_changed = 0
"let g:ale_lint_on_enter = 0
"let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

let g:ale_completion_tsserver_autoimport = 1

let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('sources', {
\ '_': ['ale', 'buffer'],
\})
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources.ocaml = ['buffer', 'around', 'member', 'tag']


"" vim-commentary OCaml
autocmd FileType ocaml setlocal commentstring=(*\ %s\ *)

