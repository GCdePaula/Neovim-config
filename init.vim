


""""""""""""""""""""
" General
""""""""""
set nocompatible
set encoding=utf-8

"" Enable mouse
set mouse=a

"" Use system clipboard for copy/paste
set clipboard=unnamedplus

"" Maintain undo history between sessions.
set undofile " undodir default in neovim already works

"" Hide buffers instead of asking to save them
set hidden

"" Reload files on external change automatically
set autoread
au FocusGained * :checktime

"" Support all kind of EOLs
set fileformats+=mac

"" Redraw only when needed
set lazyredraw

""Search upwards for tags file instead only locally
if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif
if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
""""""""""""""""""""


""""""""""""""""""""
" Colors
"""""""""""
"" Terminal color
set termguicolors "set t_Co=256 turm=xterm-256color

"" Enable syntax highlight
syntax enable

""""""""""""""""""""


""""""""""""""""""""
" Key mappings
""""""""""
let mapleader=","
xnoremap <silent> <leader>p p:let @+=@0<CR>
nnoremap <leader>dd "_dd
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
"nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

"" Y yanks from the cursor to the end of line
nnoremap Y y$

"" Makes Ctrl-U in insert mode more forgiving
inoremap <C-U> <C-G>u<C-U>

"" Toggle list mode
nmap <leader>l :set list!<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
""""""""""""""""""""


""""""""""""""""""""
" Text
""""""""""
"" Load filetype-specific indent files
filetype indent plugin on

"" Tab as four spaces
set tabstop=4 shiftwidth=4 softtabstop=0 expandtab
set smartindent autoindent smarttab

"" Lines longer than window will wrap, breaking at a word,
"" and will continue indentation, plus a return symbol.
set wrap linebreak breakindent
let &showbreak='↳ '
set display+=lastline

"" Show hidden characters
set listchars=tab:→\ ,trail:•,extends:⟩,precedes:⟨,nbsp:␣
set list

"" Delete comment character when joining commented lines
set formatoptions+=j

"" Increment ignores octal format
set nrformats-=octal

"" Change backspace behaviour
set backspace=indent,eol,start

"" Remove included files from autocomplete
set complete-=i

"" Better matching
runtime macros/matchit.vim


""""""""""""""""""""

""""""""""""""""""""
" UI Layout
""""""""""
"" Shows title in window.
set title

"" Line number style
set number " relativenumber

"" Show command line in bottom bar
set showcmd

"" Highlight current line
set cursorline

"" Allways show gutter, but not on nerdtree
set signcolumn=yes
autocmd FileType nerdtree setlocal signcolumn=no

"" Show ruler
set ruler

"" Autocomplete for command menu
set wildmenu

" Always show statusline
set laststatus=2

"" Keeps one line above/below cusror when scrolling
set scrolloff=1

"" Better split behaviour
set splitbelow
set splitright
""""""""""""""""""""



""""""""""""""""""""
" Searching
""""""""""
"" Search as characters are entered
set incsearch

"" Highlight search results
set hlsearch

"" Ignore case when searching, except when search contains
"' capital letter.
set ignorecase smartcase

"" Highlight matching [({})]
set showmatch

"" Highlight extra whitespace
" highlight ExtraWhitespace ctermbg=red guibg=red
" match ExtraWhitespace /\s\+$/
"""""""""""""""""""


"" Useful functions
function! SetIndent4()
  :set tabstop=4 shiftwidth=4
endfunction

function! SetIndent2()
  :set tabstop=2 shiftwidth=2
endfunction

map <leader>2 :call SetIndent2()<CR>
map <leader>4 :call SetIndent4()<CR>

function! UseTabs()
  set noexpandtab   " Always uses tabs instead of space characters (noet).
  set autoindent    " Copy indent from current line when starting a new line (ai).
endfunction

function! UseSpaces()
  set expandtab     " Always uses spaces instead of tab characters (et).
  set softtabstop=0 " Number of spaces a <Tab> counts for. When 0, featuer is off (sts).
  set autoindent    " Copy indent from current line when starting a new line.
  set smarttab      " Inserts blanks on a <Tab> key (as per sw, ts and sts).
endfunction
"


""""""""""""""""""""
" Vim-plug
""""""""""
call plug#begin('~/.local/share/nvim/plugged')

" Plug 'tpope/vim-sensible'

"" Scrolling feedback
" Plug 'joeytwiddle/sexy_scroller.vim'

"" UI
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'itchyny/lightline.vim'

"" Colorschemes
Plug 'morhetz/gruvbox'

"" Languages specific plugins
Plug 'tomlion/vim-solidity' " , { 'for': 'solidity' }
Plug 'pangloss/vim-javascript' " , {'for': 'javascript'}
Plug 'maxmellon/vim-jsx-pretty' " , {'for': 'javascript'}
Plug 'figitaki/vim-dune'
Plug 'let-def/ocp-indent-vim'
Plug 'tbastos/vim-lua'

"" Auto complete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'copy/deoplete-ocaml'

"" Linter
Plug 'w0rp/ale'

"" Other
" Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-commentary'
call plug#end()
""""""""""""""""""""


""""""""""""""""""""
" Plug-in configuration
""""""""""

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }

"" Set colorscheme
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="medium" " hard, medium or soft
colorscheme gruvbox " https://github.com/morhetz/gruvbox
" let ayucolor="mirage" " light, mirage or dark
" colorscheme ayu " https://github.com/ayu-theme/ayu-vim

"" Deoplete stuff
if !exists('g:deoplete#omni_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.ocaml = '[^. *\t]\.\w*|\s\w*|#'

" enable deoplete
let g:deoplete#enable_at_startup = 1

" this is the default, make sure it is not set to "omnifunc" somewhere else in your vimrc
let g:deoplete#complete_method = "complete"

" other completion sources suggested to disable
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources.ocaml = ['buffer', 'around', 'member', 'tag']

" no delay before completion
let g:deoplete#auto_complete_delay = 0


"" NERDTree configs
function! ToggleNT()
    :NERDTreeToggle
    :NERDTreeMirror
endfunction
map <silent> <C-n> :call ToggleNT()<CR>

let g:NERDTreeWinPos = "right"
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"" Ignore ocamllex and ocamlyacc
let g:ale_pattern_options = {
\   '.*\.mll$': {'ale_enabled': 0},
\   '.*\.mly$': {'ale_enabled': 0},
\}

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## 5af981ada07fa7277c648f8c4b372f0f ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/Users/gabrielcpaula/Documents/Mestrado/Compiladores_grad.nosync/monga_compiler/_opam/share/ocp-indent/vim/indent/ocaml.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line


