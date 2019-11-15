
syntax enable

"" Allways show gutter
set signcolumn=yes


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
\   'ocaml' : ['merlin', 'ols', 'ocp-indent'],
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

call deoplete#custom#source('_', 'max_menu_width', 0)
call deoplete#custom#source('_', 'max_info_width', 0)

"" vim-commentary OCaml
autocmd FileType ocaml setlocal commentstring=(*\ %s\ *)

"" Disable autoindent for Menhir/ocamlyacc and ocamllex
autocmd BufRead,BufNewFile *.mly setlocal indentexpr=
autocmd BufRead,BufNewFile *.mll setlocal indentexpr=

